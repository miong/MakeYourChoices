var storyModule = require("../build/story_module.js");
var Story = require('inkjs').Story;

class TreeNode {
    constructor(value, parent) {
        this.value = value;
         this.varContent = null;
         this.descendents = new Map();
         this.parent = parent;
    }
}

// Create ink story from the content using inkjs
var story = new Story(storyModule.storyContent);
var flatten = new TreeNode("Story begings", null);
var dnodes = new Map();
var finalNodes = [];

function performAnalysis() {
    dnodes.clear();
    finalNodes = [];
    flatten = new TreeNode("Story begings", null);
    story.ResetState();
    startStory();
    var savedState = story.state.ToJson();
    story.currentChoices.forEach(function(choice) {
        story.state.LoadJson(savedState);
        exploreChoice(choice.index, choice.text, flatten)
    });
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

function exploreChoice(index, text, flattenParentNode) {
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
        flattenParentNode.descendents.set(text, flattenNode);

        if (!isStoryInTerminalState()) {
            story.currentChoices.forEach(function(choice) {
                exploreChoice(choice.index, choice.text, flattenNode);
            });
        } else {
            var endNode = new TreeNode("END", flattenNode);
            endNode.varContent = story.variablesState;
            flattenNode.descendents.set("NOOP", endNode);
            finalNodes.push(endNode);
        }
        story.state.LoadJson(savedState);
    }
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



module.exports = {
	
	processStory: function()
	{
			performAnalysis();
	},
	
	sucessAvailiableAtEnd: function(success_name)
	{
		
	}
	
}