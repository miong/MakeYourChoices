var libtest = require("./libtest");
var libink = require("./libink");
module.exports.testRunnable = () => {

libtest.declare_module("story");
libtest.module_setup("story", function()
{
	libink.processStory();
});

libtest.declare_test("story", "All success are winnable", function ()
{
	libtest.todo("Implement this test");
});


}

