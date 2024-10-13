@echo off
setlocal enabledelayedexpansion

REM Define the folder for Chronix scripts and output scripts
set "scriptFolder=.\ChronixScripts"
set "outputFolder=.\OutputScripts"
set "definitionsFile=.\ChronixDefinitions.txt"

REM Create folders if they don't exist
if not exist "%scriptFolder%" (
    mkdir "%scriptFolder%"
    echo Created folder: %scriptFolder%
)

if not exist "%outputFolder%" (
    mkdir "%outputFolder%"
    echo Created folder: %outputFolder%
)

REM Create the definitions document if it doesn't exist
if not exist "%definitionsFile%" (
    (
        echo Chronix Language Definitions
        echo -------------------------------------------
        echo 1. print("message") - Displays the message on the console.
        echo 2. exit() - Exits the program.
        echo 3. let variable = value - Assigns a value to a variable.
        echo 4. if (condition) { ... } - Executes code block if condition is true.
        echo 5. for (init; condition; increment) { ... } - Loops through code block.
        echo 6. function name(parameters) { ... } - Defines a function.
        echo 7. return value - Returns a value from a function.
        echo 8. // comment - Starts a comment (ignored by the compiler).
        echo 9. variable++ - Increments the variable by 1.
        echo 10. variable-- - Decrements the variable by 1.
        echo 11. varName = "string" - Assigns a string to a variable.
        echo 12. array[] = {1, 2, 3} - Initializes an array.
        echo 13. length(array) - Returns the length of the array.
        echo 14. push(array, value) - Adds a value to the end of the array.
        echo 15. pop(array) - Removes the last element from the array.
        echo 16. include("file") - Includes another Chronix file.
        echo 17. try { ... } catch { ... } - Handles exceptions.
        echo 18. while (condition) { ... } - Loops while the condition is true.
        echo 19. break - Exits a loop or switch statement.
        echo 20. continue - Skips the current iteration of a loop.
        echo 21. switch(variable) { ... } - Selects a block of code to execute.
        echo 22. case value: ... - Defines a case in a switch statement.
        echo 23. default: ... - Defines a default case in a switch statement.
        echo 24. this - Refers to the current object.
        echo 25. async function name(parameters) { ... } - Defines an asynchronous function.
        echo 26. await expression - Pauses execution until the expression is resolved.
        echo 27. map(array, function) - Applies a function to each element in the array.
        echo 28. filter(array, function) - Filters elements in the array based on a function.
        echo 29. reduce(array, function, initialValue) - Reduces the array to a single value.
        echo 30. object.property - Accesses a property of an object.
        echo 31. new ClassName() - Creates a new instance of a class.
        echo 32. class ClassName { ... } - Defines a class.
        echo 33. static methodName() - Defines a static method in a class.
        echo 34. constructor(parameters) - Defines a constructor for a class.
        echo 35. override methodName() - Overrides a method in a subclass.
        echo 36. super() - Calls a method from the parent class.
        echo 37. import module - Imports a module or library.
        echo 38. export value - Exports a value from a module.
        echo 39. instanceof - Checks if an object is an instance of a class.
        echo 40. instanceof - Checks if an object is an instance of a class.
        echo 41. throw expression - Throws an exception.
        echo 42. return expression - Returns a value from a function.
        echo 43. try { ... } - Starts a block of code that will be tested for errors.
        echo 44. catch (error) { ... } - Defines a block of code that executes if an error occurs.
        echo 45. finally { ... } - Defines a block of code that executes after try/catch.
        echo 46. with (object) { ... } - Executes a block of code with a specified object.
        echo 47. do { ... } while (condition) - Executes a block of code at least once and repeats while a condition is true.
        echo 48. let variable - Declares a variable.
        echo 49. const variable - Declares a constant variable.
        echo 50. var variable - Declares a variable (function-scoped).
        echo 51. date() - Gets the current date and time.
        echo 52. random(min, max) - Returns a random number between min and max.
        echo 53. log(variable) - Logs a variable to the console.
        echo 54. exit(code) - Exits the program with a specific exit code.
        echo 55. clear() - Clears the console.
        echo 56. sleep(milliseconds) - Pauses execution for a specified time.
        echo 57. toString(variable) - Converts a variable to a string.
        echo 58. parseInt(string) - Parses a string to an integer.
        echo 59. parseFloat(string) - Parses a string to a float.
        echo 60. isNaN(value) - Checks if a value is NaN (Not a Number).
        echo 61. isFinite(value) - Checks if a value is finite.
        echo 62. encodeURIComponent(uri) - Encodes a URI component.
        echo 63. decodeURIComponent(encodedURI) - Decodes a URI component.
        echo 64. alert(message) - Displays an alert dialog with a message.
        echo 65. confirm(message) - Displays a confirmation dialog.
        echo 66. prompt(message) - Displays a prompt dialog for user input.
        echo 67. push(array, value) - Adds an item to the end of an array.
        echo 68. pop(array) - Removes the last item from an array.
        echo 69. shift(array) - Removes the first item from an array.
        echo 70. unshift(array, value) - Adds an item to the start of an array.
        echo 71. splice(array, index, count) - Removes or replaces elements from an array.
        echo 72. slice(array, start, end) - Creates a new array with a portion of the original array.
        echo 73. join(array, separator) - Joins all elements of an array into a string.
        echo 74. split(string, separator) - Splits a string into an array.
        echo 75. indexOf(array, value) - Returns the first index of a value in an array.
        echo 76. lastIndexOf(array, value) - Returns the last index of a value in an array.
        echo 77. includes(array, value) - Checks if an array contains a value.
        echo 78. every(array, function) - Checks if all elements in an array pass a test.
        echo 79. some(array, function) - Checks if at least one element in an array passes a test.
        echo 80. find(array, function) - Returns the first element in an array that satisfies a test.
        echo 81. findIndex(array, function) - Returns the index of the first element in an array that satisfies a test.
        echo 82. map(array, function) - Creates a new array with the results of calling a function on every element.
        echo 83. filter(array, function) - Creates a new array with all elements that pass a test.
        echo 84. reduce(array, function, initialValue) - Executes a reducer function on each element of the array.
        echo 85. reduceRight(array, function, initialValue) - Applies a function against an accumulator and each element.
        echo 86. forEach(array, function) - Executes a provided function once for each array element.
        echo 87. keys(object) - Returns an array of a given object's own property names.
        echo 88. values(object) - Returns an array of a given object's own enumerable property values.
        echo 89. entries(object) - Returns an array of a given object's own enumerable string-keyed property [key, value] pairs.
        echo 90. freeze(object) - Freezes an object so that its properties cannot be changed.
        echo 91. seal(object) - Seals an object so that no new properties can be added.
        echo 92. preventExtensions(object) - Prevents new properties from being added to an object.
        echo 93. isExtensible(object) - Determines if an object is extensible.
        echo 94. isSealed(object) - Determines if an object is sealed.
        echo 95. isFrozen(object) - Determines if an object is frozen.
        echo 96. assign(target, ...sources) - Copies values from one or more source objects to a target object.
        echo 97. create(proto, propertiesObject) - Creates a new object with the specified prototype object and properties.
        echo 98. getOwnPropertyDescriptor(object, property) - Returns a property descriptor for a property of an object.
        echo 99. getOwnPropertyDescriptors(object) - Returns all own property descriptors of an object.
        echo 100. defineProperty(object, property, descriptor) - Defines a new property directly on an object.
    ) > "%definitionsFile%"
    echo Created definitions document: %definitionsFile%
)

:menu
cls
echo -------------------------------------------
echo              Chronix Compiler
echo -------------------------------------------
echo 1. Show Instructions and Definitions
echo 2. Translate Chronix Script to Batch
echo 3. Open Definitions Document
echo 4. Exit
echo -------------------------------------------
set /p choice=Choose an option (1, 2, 3, or 4): 

if "%choice%"=="1" goto showInstructions
if "%choice%"=="2" goto translateChronixToBat
if "%choice%"=="3" start notepad "%definitionsFile%" & goto menu
if "%choice%"=="4" exit

goto menu

REM Function to display instructions and definitions
:showInstructions
echo -------------------------------------------
echo               Chronix Language
echo -------------------------------------------
echo Instructions for Beginners:
echo - This compiler translates Chronix scripts (.chrnix) into Batch scripts (.bat).
echo - Use 'print("message")' to display messages.
echo - Use 'exit()' to terminate the script.
echo 
echo Here are some basic definitions:
echo 1. print("message") - Displays the message on the console.
echo 2. exit() - Exits the program.
echo 3. let variable = value - Assigns a value to a variable.
echo 4. if (condition) { ... } - Executes code block if condition is true.
echo 5. for (init; condition; increment) { ... } - Loops through code block.
echo 6. function name(parameters) { ... } - Defines a function.
echo 7. return value - Returns a value from a function.
echo 8. // comment - Starts a comment (ignored by the compiler).
echo 9. variable++ - Increments the variable by 1.
echo 10. variable-- - Decrements the variable by 1.
echo 
echo More definitions can be found in the documentation.
echo -------------------------------------------
pause
goto menu

REM Function to translate Chronix to Batch
:translateChronixToBat
cls
set /p "chronixFile=Enter the name of the Chronix file (without .chrnix): "
set "chronixFile=%scriptFolder%\%chronixFile%.chrnix"
set "batchFile=%outputFolder%\%~n1.bat"

REM Check if the Chronix file exists
if not exist "%chronixFile%" (
    echo Error: File not found.
    pause
    goto menu
)

REM Create/overwrite the Batch file
echo @echo off > "%batchFile%"
echo REM Translated from %chronixFile% >> "%batchFile%"

REM Read the Chronix file and translate line by line
for /f "usebackq delims=" %%a in ("%chronixFile%") do (
    set "line=%%a"
    
    REM Add your translation logic here
    if "!line!"=="print(\"Hello, World!\")" (
        echo echo Hello, World! >> "%batchFile%"
    ) else if "!line!"=="exit()" (
        echo exit >> "%batchFile%"
    ) else if "!line:~0,4!"=="let " (
        REM Handle variable assignment
        set "varName=!line:~4,-1!"
        echo set !varName! >> "%batchFile%"
    )
)

echo Translation completed: "%batchFile%"
pause
goto menu
