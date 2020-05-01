// LIB TEST INCLUDES
var libtest = require("./libtest");

console.log("--- Test Requirement ---");
libtest.verify_requirements();

console.log("--- Test Main ---");
// DECLARE TEST FILES
libtest.declare_testfile("libtest_ut");
libtest.declare_testfile("story_ut");

// LAUNCH TESTS
libtest.execute_tests();