(function(storyContent) {

    // Create ink story from the content using inkjs
    var story = new inkjs.Story(storyContent);
	
	var audioPlayer = document.getElementById("audio");
	var audioButton = document.getElementById("audioButton");
	audioPlayer.volume = 0.3;
	var audioMuted = false;
	var currentAudio = ""
	var currentAudioChanged = false;
	var currentTable = null;

    // Global tags - those at the top of the ink file
    // We support:
    //  # theme: dark
    //  # author: Your Name
    var globalTags = story.globalTags;
    if( globalTags ) {
        for(var i=0; i<story.globalTags.length; i++) {
            var globalTag = story.globalTags[i];
            var splitTag = splitPropertyTag(globalTag);
            
            // THEME: dark
            if( splitTag && splitTag.property == "theme" ) {
                document.body.classList.add(splitTag.val);
            }
            
            // author: Your Name
            else if( splitTag && splitTag.property == "author" ) {
                var byline = document.querySelector('.byline');
                byline.innerHTML = "by "+splitTag.val;
            }
        }
    }

    var storyContainer = document.querySelector('#story');
    var outerScrollContainer = document.querySelector('.outerContainer');

    // Kick off the start of the story!
    continueStory(true);

    // Main story processing function. Each time this is called it generates
    // all the next content up as far as the next set of choices.
    function continueStory(firstTime) {

        var paragraphIndex = 0;
        var delay = 0.0;
        
        // Don't over-scroll past new content
        var previousBottomEdge = firstTime ? 0 : contentBottomEdgeY();

        // Generate story text - loop through available content
        while(story.canContinue) {

            // Get ink to generate the next paragraph
            var paragraphText = story.Continue();
            var tags = story.currentTags;
			var isTable = false;
			var isTableRow = false;
            
            // Any special tags included with this line
            var customClasses = [];
            for(var i=0; i<tags.length; i++) {
                var tag = tags[i];

                // Detect tags of the form "X: Y". Currently used for IMAGE and CLASS but could be
                // customised to be used for other things too.
                var splitTag = splitPropertyTag(tag);

                // IMAGE: src
                if( splitTag && splitTag.property == "IMAGE" ) {
                    var imageElement = document.createElement('img');
                    imageElement.src = splitTag.val;
                    storyContainer.appendChild(imageElement);

                    showAfter(delay, imageElement);
                    delay += 200.0;
                }
				// AUDIO: src
				else if( splitTag && splitTag.property == "AUDIO" ) {
					var oldAudio = currentAudio;
                    currentAudio = "assets/audio/themes/"+splitTag.val
					currentAudioChanged = currentAudio != oldAudio;
					setAudio();
                }
				//TABLE
				else if( tag == "TABLE" ) {
					isTable = true;
				}
				//TABLEROW
				else if( currentTable != null && tag == "TABLEROW" ) {
					isTableRow = true;
				}

                // CLASS: className
                else if( splitTag && splitTag.property == "CLASS" ) {
                    customClasses.push(splitTag.val);
                }

                // CLEAR - removes all existing content.
                // RESTART - clears everything and restarts the story from the beginning
                else if( tag == "CLEAR" || tag == "RESTART" ) {
                    removeAll("p");
                    removeAll("img");
                    
                    // Comment out this line if you want to leave the header visible when clearing
                    setVisible(".header", false);

                    if( tag == "RESTART" ) {
                        restart();
                        return;
                    }
                }
            }
			
			if( !isTableRow && currentTable != null )
			{
				storyContainer.appendChild(currentTable);
				currentTable = null;
			}

            // Create paragraph element (initially hidden)
			if( isTable ) {
				var currentTable = document.createElement("table");
				var thead = currentTable.createTHead();
				var row = thead.insertRow();
				var cell = row.insertCell();
				var text = document.createTextNode(paragraphText);
				cell.appendChild(text);
				cell.colSpan = 1;
			}
			else if( isTableRow ) {
				var tbody = currentTable.createTBody();
				var row = tbody.insertRow();
				var contents = paragraphText.split("$");
				var rowCols = contents.length;
				var headColSpan = currentTable.rows[0].cells[0].colSpan
				currentTable.rows[0].cells[0].colSpan = Math.max(rowCols, headColSpan);
				for (c in contents) {
					var cell = row.insertCell();
					var text = document.createTextNode(contents[c]);
					cell.appendChild(text);
				}
			}
			else {
				var paragraphElement = document.createElement('p');
				paragraphElement.innerHTML = paragraphText;
				storyContainer.appendChild(paragraphElement);
            
				// Add any custom classes derived from ink tags
				for(var i=0; i<customClasses.length; i++)
					paragraphElement.classList.add(customClasses[i]);
				
				// Fade in paragraph after a short delay
				showAfter(delay, paragraphElement);
				delay += 200.0;
			}

        }

        // Create HTML choices from ink choices
        story.currentChoices.forEach(function(choice) {

            // Create paragraph with anchor element
            var choiceParagraphElement = document.createElement('p');
            choiceParagraphElement.classList.add("choice");
            choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`
            storyContainer.appendChild(choiceParagraphElement);

            // Fade choice in after a short delay
            showAfter(delay, choiceParagraphElement);
            delay += 200.0;

            // Click on choice
            var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
            choiceAnchorEl.addEventListener("click", function(event) {

                // Don't follow <a> link
                event.preventDefault();

                // Remove all existing choices
                removeAll("p.choice");
				
				if(choice.text == "Grant your prize")
				{
					showAllSuccessPrize();
				}
				
				if(choice.text == "Mute/Unmute")
				{
					audioMuted = !audioMuted;
					if(audioMuted)
					{
						audioPlayer.pause();
						audioPlayer.currentTime = 0.0;
					}
					else 
					{
						currentAudioChanged = true;
						if(audioPlayer.volume == 0)
						{
							audioPlayer.volume = 0.5;
						}
					}
						
				}
				
				if(choice.text == "Volume down")
				{
					audioPlayer.volume -= 0.1;
					if(audioPlayer.volume < 0)
					{
						audioPlayer.volume = 0;
					}
				}
				
				if(choice.text == "Volume up")
				{
					audioPlayer.volume += 0.1;
					if(audioPlayer.volume > 1)
					{
						audioPlayer.volume = 1;
					}
				}
				
				//GMI : Add Restore function
				if(choice.text == "Load game")
				{
					loadState();
				}
				else
				{
					// Tell the story where to go next
					story.ChooseChoiceIndex(choice.index);
				}
				
				//GMI : Add Save function
				if(choice.text == "Save game")
				{
					saveState();
				}
				

                // Aaand loop
				setAudio();
                continueStory();
            });
        });

        // Extend height to fit
        // We do this manually so that removing elements and creating new ones doesn't
        // cause the height (and therefore scroll) to jump backwards temporarily.
        storyContainer.style.height = contentBottomEdgeY()+"px";

        if( !firstTime )
            scrollDown(previousBottomEdge);
    }

	function setAudio()
	{
		if(!audioMuted)
		{
			audioButton.volume = 0.5;
			audioButton.load();
			audioButton.play();
		}
		if (currentAudio != "" && currentAudioChanged)
		{
			var sourceMp3 = document.getElementById('audioSourceMp3');
			sourceMp3.src = currentAudio+".mp3"
			audioPlayer.load();
			if(!audioMuted)
			{
				audioPlayer.play();
			}
			currentAudioChanged = false;
		}
	}

    function restart() {
        story.ResetState();

        setVisible(".header", true);

        continueStory(true);

        outerScrollContainer.scrollTo(0, 0);
    }
	
	function saveState()
	{
		var savedState = story.state.ToJson();
		var element = document.createElement('a');
		element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(savedState));
		element.setAttribute('download', "make_your_choices.save");
		element.style.display = 'none';
		document.body.appendChild(element);
		element.click();
		document.body.removeChild(element);
	}
	
	function loadState()
	{
		var input = document.createElement('input');
		input.type = 'file';
		input.onchange = e => { 
			// getting a hold of the file reference
			var file = e.target.files[0]; 
			// setting up the reader
			var reader = new FileReader();
			reader.readAsText(file,'UTF-8');
			// here we tell the reader what to do when it's done reading...
			reader.onload = readerEvent => {
				var savedState = readerEvent.target.result; // this is the content!
				try {
					story.state.LoadJson(savedState);
					removeAll("p");
					removeAll("img");
					setVisible(".header", false);
					continueStory(true);
				} catch (error){
					console.log(error);
				}
			}
		}
		input.click();
	}
	
	function showAllSuccessPrize()
	{
		var button = document.createElement('button');
		button.onclick = () => {
			window.open('https://youtu.be/dQw4w9WgXcQ',"Your prize");
		};
		button.click();
		removeAll("button");
		
	}

    // -----------------------------------
    // Various Helper functions
    // -----------------------------------

    // Fades in an element after a specified delay
    function showAfter(delay, el) {
        el.classList.add("hide");
        setTimeout(function() { el.classList.remove("hide") }, delay);
    }

    // Scrolls the page down, but no further than the bottom edge of what you could
    // see previously, so it doesn't go too far.
    function scrollDown(previousBottomEdge) {

        // Line up top of screen with the bottom of where the previous content ended
        var target = previousBottomEdge;
        
        // Can't go further than the very bottom of the page
        var limit = outerScrollContainer.scrollHeight - outerScrollContainer.clientHeight;
        if( target > limit ) target = limit;

        var start = outerScrollContainer.scrollTop;

        var dist = target - start;
        var duration = 300 + 300*dist/100;
        var startTime = null;
        function step(time) {
            if( startTime == null ) startTime = time;
            var t = (time-startTime) / duration;
            var lerp = 3*t*t - 2*t*t*t; // ease in/out
            outerScrollContainer.scrollTo(0, (1.0-lerp)*start + lerp*target);
            if( t < 1 ) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

    // The Y coordinate of the bottom end of all the story content, used
    // for growing the container, and deciding how far to scroll.
    function contentBottomEdgeY() {
        var bottomElement = storyContainer.lastElementChild;
        return bottomElement ? bottomElement.offsetTop + bottomElement.offsetHeight : 0;
    }

    // Remove all elements that match the given selector. Used for removing choices after
    // you've picked one, as well as for the CLEAR and RESTART tags.
    function removeAll(selector)
    {
        var allElements = storyContainer.querySelectorAll(selector);
        for(var i=0; i<allElements.length; i++) {
            var el = allElements[i];
            el.parentNode.removeChild(el);
        }
    }

    // Used for hiding and showing the header when you CLEAR or RESTART the story respectively.
    function setVisible(selector, visible)
    {
        var allElements = storyContainer.querySelectorAll(selector);
        for(var i=0; i<allElements.length; i++) {
            var el = allElements[i];
            if( !visible )
                el.classList.add("invisible");
            else
                el.classList.remove("invisible");
        }
    }

    // Helper for parsing out tags of the form:
    //  # PROPERTY: value
    // e.g. IMAGE: source path
    function splitPropertyTag(tag) {
        var propertySplitIdx = tag.indexOf(":");
        if( propertySplitIdx != null ) {
            var property = tag.substr(0, propertySplitIdx).trim();
            var val = tag.substr(propertySplitIdx+1).trim(); 
            return {
                property: property,
                val: val
            };
        }

        return null;
    }

})(storyContent);