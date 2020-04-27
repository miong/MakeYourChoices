(function(storyContent) {

    class TreeNode {
        constructor(value, parent) {
            this.value = value;
            this.varContent = null;
            this.descendents = new Map();
            this.parent = parent;
        }
    }

    // Create ink story from the content using inkjs
    var story = new inkjs.Story(storyContent);
    var flatten = new TreeNode("Story begings", null);
    var dnodes = new Map();
    var finalNodes = [];

    var startButton = document.getElementById("StartAnalysis");
    var fullViewChekcBox = document.getElementById("fullView");
    var loader = document.getElementById("loader");

    startButton.onclick = function start() {
        loader.classList.remove("hide");
        var expectedVarContent = document.getElementById("ValueInput").value;
        var inputVal = document.getElementById("varName").value;
        var pointVal = document.getElementById("pointName").value;
        if (pointVal == "") {
            pointVal = "END"
		}
		if (inputVal == "") {
            inputVal = "V_CURRENT_STORY_ENDING"
        }
        performAnalysis(inputVal, pointVal, expectedVarContent);
    }

    function performAnalysis(inputVal, pointVal, expectedVarContent) {
        dnodes.clear();
        finalNodes = [];
        flatten = new TreeNode("Story begings", null);
        story.ResetState();
        startStory()
        flatten.varContent = getVarValue(inputVal);
		if(flatten.varContent == undefined)
		{
			loader.innerHTML = inputVal + " is not a valid variable name (Case sensitive)";
			return;
		}
        var savedState = story.state.ToJson();
        story.currentChoices.forEach(function(choice) {
            story.state.LoadJson(savedState);
            exploreChoice(choice.index, choice.text, flatten, inputVal)
        });
        var resSet = new Set();
        getPossibleValuesAt(flatten, pointVal, resSet);
		loader.innerHTML = "Number of flatten end is " + finalNodes.length + "<br>";
        loader.innerHTML += "Debug tree generated for " + inputVal + "<br>";
		if(presentSet(resSet) == "[]")
		{
			loader.innerHTML += pointVal + " is not a valid point name (Case sensitive or No choice inside)";
		}
		else
		{
			loader.innerHTML += inputVal + " possible values at " + pointVal + " are " + presentSet(resSet)
		}
        simplifyTree(pointVal, expectedVarContent);
        drawResult();
    }

    function presentSet(set) {
        return "[" + Array.from(set).join('], [') + "]";
    }

    function getPossibleValuesAt(node, pointVal, resSet) {
        if (node.value == pointVal) {
            resSet.add(node.varContent.toString())
        } else if (node.descendents.size > 0) {
            var res = "";
            node.descendents.forEach(function(value, key, map) {
                getPossibleValuesAt(value, pointVal, resSet);
            });
        }
    }

    function startStory() {
        //Skiping menu
        continueStory();
        story.ChooseChoiceIndex(0);
        continueStory();
        story.ChooseChoiceIndex(0);
        continueStory();
    }

    function continueStory() {
		res = false;
        while (story.canContinue) {
            //Skip texts
            story.Continue();
			res |= story.currentTags.includes("DBG_SAME_STATE");
        }
		return res;
    }

    function exploreChoice(index, text, flattenParentNode, monitored) {
        if (isAvoidedChoice(text)) {
            return;
        }
        if (story.currentChoices.length >= 1) {
            var savedState = story.state.ToJson();
            var nodeId = story.state.currentChoices[index].targetPath._components[0].name;
			
            story.ChooseChoiceIndex(index);
            var reboocling = continueStory();
			if(story.currentTags.includes("DBG_SAME_STATE")
				|| reboocling)
			{
				story.state.LoadJson(savedState);
				return;
			}

            var flattenNode = new TreeNode(nodeId, flattenParentNode);
            flattenNode.varContent = getVarValue(monitored);
            flattenParentNode.descendents.set(text, flattenNode);

            if (!isStoryInTerminalState()) {
                story.currentChoices.forEach(function(choice) {
                    exploreChoice(choice.index, choice.text, flattenNode, monitored);
                });
            } else {
                var endNode = new TreeNode("END", flattenNode);
                endNode.varContent = getVarValue(monitored);
                flattenNode.descendents.set("NOOP", endNode);
                finalNodes.push(endNode);
            }
            story.state.LoadJson(savedState);
        }
    }

    function getVarValue(name) {
		if(story.variablesState.$(name) == undefined)
		{
			return undefined;
		}
        if (!(story.variablesState.$(name) instanceof  Map)) {
            return story.variablesState.$(name).toString();
        }
        var mapList = story.variablesState.$(name);
        var result = [];
        mapList.forEach(function(value, key, map) {
            obj = JSON.parse(key);
            result.push(obj.itemName);
        });
		if(result.length > 0)
		{
			return result.toString();
		}
		return "EMPTY";
    }

    function isAvoidedChoice(text) {
        switch (text) {
            case "Save game":
                return true;
        }
        return false;
    }

    function isStoryInTerminalState() {
        var res = true;
        story.currentChoices.forEach(function(choice) {
            switch (choice.text) {
                case "See affinities":
                case "See status":
                case "Try again from the beginning":
                case "Return to the menu":
                    break;
                default:
                    res = false;
                    break;
            }
        });
        return res;
    }

    function simplifyTree(pointVal, expectedVarContent) {
		cutFromEndToPoint(pointVal, expectedVarContent);
        if (!fullViewChekcBox.checked) {
            cutUnchangingBranches(flatten, expectedVarContent);
        }
        for (var i = 0; i < finalNodes.length; i++) {
            shortenSingleBranch(finalNodes[i]);
        }
    }

    function cutUnchangingBranches(node, expectedVarContent) {
		if(finalNodes.length == 0)
		{
			return;
		}
        if (getNbFinalNodes(node) <= 1) {
            return;
        }
        node.descendents.forEach(function(value, key, map) {
            cutUnchangingBranches(value, expectedVarContent);
        });
        var buildingMap = new Map();
        node.descendents.forEach(function(value, key, map) {
            var nbFinalNode = getNbFinalNodes(value);
            if (nbFinalNode > 1) {
                return;
            }
            var finalNode = getFinalNode(value);
            var finalValue = finalNode.varContent;
			if(expectedVarContent != "" && finalValue != expectedVarContent)
			{
				return;
			}
            if (buildingMap.has(finalValue)) {
                var current = buildingMap.get(finalValue);
                buildingMap.set(finalValue, current + ", " + key);
            } else {
                buildingMap.set(finalValue, key);
            }
            var index = finalNodes.indexOf(finalNode);
            finalNodes.splice(index, 1);
            node.descendents.delete(key);
        });

        buildingMap.forEach(function(value, key, map) {
            var endNode = new TreeNode("MERGED END", node);
            endNode.varContent = key;
            node.descendents.set("[" + value + "]", endNode);
            finalNodes.push(endNode);
        });
    }

    function getFinalNode(node) {
        if (node.descendents.size != 0) {
            return getFinalNode(node.descendents.entries().next().value[1]);
        }
        return node;
    }

    function getNbFinalNodes(node) {
        if (node.descendents.size == 0) {
            return 1;
        }
        var res = 0;
        node.descendents.forEach(function(value, key, map) {
            res += getNbFinalNodes(value);
        });
        return res;
    }

    function getNbFinalNodeMaxDepth(node) {
        if (node.descendents.size == 0) {
            return 0;
        }
        var res = 0;
        node.descendents.forEach(function(value, key, map) {
            res = Math.max(res, getNbFinalNodes(value));
        });
        return res;
    }


    function shortenSingleBranch(node) {
        var curr = node.parent; // ignore end
        while (curr != null) {
            var daddy = curr.parent;
            if (daddy != null && curr.descendents.size == 1 && daddy.descendents.size == 1 && curr.varContent == daddy.varContent) {
                curr.descendents.entries().next().value[1].parent = daddy;
            }
            curr = daddy;
        }
    }
	
	function cutFromEndToPoint(pointVal, expectedVarContent)
	{
		newFinalNodes = [];
		for (var i = 0; i < finalNodes.length; i++) {
            var curr = finalNodes[i];
			while (curr != null) {
				if(curr.value == pointVal)
				{
					break;
				}
				curr = curr.parent;
			}
			if(curr != null)
			{
				var node;
				if(pointVal != "END")
				{
					node = new TreeNode("FORCED END",curr)
					node.varContent = curr.varContent;
					curr.descendents.clear();
					curr.descendents.set("force ende", node);
				}
				else
				{
					node = curr;
				}
				if(expectedVarContent == "" || node.varContent == expectedVarContent)
				{
					newFinalNodes.push(node);
				}
			}
        }
		finalNodes = newFinalNodes;
	}

    function drawResult() {
        tree_structure = [];

        config = {
            container: "#flattenTree",
            rootOrientation: "NORTH",
            connectors: {
                type: "bCurve",
                style: {
                    "stroke-width": 2
                }
            },
            scrollbar: "fancy",
            node: {
                collapsable: true,
                drawLineThrough: false
            }
        };
        tree_structure.push(config);

		var nameText = "START";
		if(finalNodes.length == 0)
		{
			nameText = "NO PATH";
		}

        root = {
            text: {
                name: nameText,
                desc: "Initial value : " + flatten.varContent
            },
            collapsed: true
        };
        tree_structure.push(root);

        for (var i = 0; i < finalNodes.length; i++) {
            drawPath(finalNodes[i], tree_structure, root);
        }
		
		new Treant(tree_structure);
    }

    function drawPath(node, array, root) {
        var curr = node;
        var child = null;
        while (curr != null) {
            dnode = getDnode(curr);
            if (child != null) {
                child.parent = dnode;
				addUniqueDnode(child, array);
            }
			if(dnode.parent != null)
			{
				return;
			}
            curr = curr.parent;
            child = dnode;
            if (curr == null) {
                dnode.parent = root;
                addUniqueDnode(dnode, array);
            }
        }
    }

    function addUniqueDnode(elem, array) {
        for (var j = 1; j < array.length; j++) {
            var item = array[j];
            if (item.text.name == elem.text.name && item.text.desc == elem.text.desc && item.parent == elem.parent) {
                return;
            }
        }
        array.push(elem);
    }

    function getDnode(node) {
        var collapsed = node.descendents.size > 3 || getNbFinalNodeMaxDepth(node) > 5;
        if (node.value == "END" || node.value == "FORCED END") {
            dnode = {
                parent: null,
                text: {
                    name: node.value,
                    desc: "Final value : " + node.varContent
                },
                collapsed: collapsed
            };
            return dnode;
        }

        var choice = getChoiseTo(node);
        var parents = getFiliation(node);

        if (!dnodes.has(node.value)) {
            dnode = {
                parent: null,
                text: {
                    name: node.value,
                    desc: choice + " -> " + node.varContent
                },
                collapsed: collapsed
            };
            var pair = new Map();
            var pair2 = new Map();
            var pair3 = new Map();
            pair3.set(parents, dnode);
            pair2.set(node.varContent, pair3);
            pair.set(choice, pair2);
            dnodes.set(node.value, pair);
            return dnode;
        }

        if (!dnodes.get(node.value).has(choice)) {
            dnode = {
                parent: null,
                text: {
                    name: node.value,
                    desc: choice + " -> " + node.varContent
                },
                collapsed: collapsed
            };
            var pair = dnodes.get(node.value);
            var pair2 = new Map();
            var pair3 = new Map();
            pair3.set(parents, dnode);
            pair2.set(node.varContent, pair3);
            pair.set(choice, pair2);
            return dnode;
        }

        if (!dnodes.get(node.value).get(choice).has(node.varContent)) {
            dnode = {
                parent: null,
                text: {
                    name: node.value,
                    desc: choice + " -> " + node.varContent
                },
                collapsed: collapsed
            };
            var pair = dnodes.get(node.value);
            var pair2 = pair.get(choice);
            var pair3 = new Map();
            pair3.set(parents, dnode);
            pair2.set(node.varContent, pair3);
            return dnode;
        }

        if (!dnodes.get(node.value).get(choice).get(node.varContent).has(parents)) {
            dnode = {
                parent: null,
                text: {
                    name: node.value,
                    desc: choice + " -> " + node.varContent
                },
                collapsed: collapsed
            };
            var pair = dnodes.get(node.value);
            var pair2 = pair.get(choice);
            var pair3 = pair2.get(node.varContent);
            pair3.set(parents, dnode);
            return dnode;
        }

        return dnodes.get(node.value).get(choice).get(node.varContent).get(parents);
    }

    function getChoiseTo(node) {
        if (node.parent == null) {
            return "start game"
        }
        var res = "[Story continues]";
        var BreakException = {};
        try {
            node.parent.descendents.forEach(function(value, key, map) {
                if (value === node) {
                    res = key;
                    throw BreakException;
                }
            });
        } catch (e) {
            if (e !== BreakException) throw e;
        }
        return res;
    }

    function getFiliation(node) {
        if (node.parent == null) {
            return "root." + node.value;
        }
        return getFiliation(node.parent) + "." + node.value;
    }

})(storyContent);
