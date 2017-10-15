// This is where it all goes :)

    setInterval ('cursorAnimation()', 1000);
	var prompt = "website under construction..."
	var output_count = 0
	var myVar = setInterval(displayPrompt, 50);

function displayPrompt() {
    var newPrompt = "";

    for(i = 0; i < output_count; i++){newPrompt += prompt[i]};
    
    $('#caption').html(newPrompt);
    
    if (output_count < prompt.length)
    {
    	output_count += 1
    }
}

function cursorAnimation() {
    $('#cursor').animate({
        opacity: 0
    }, 'fast', 'swing').animate({
        opacity: 1
    }, 'fast', 'swing');
}