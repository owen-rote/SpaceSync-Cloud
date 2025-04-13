#!/bin/bash

# Function to create a POST request with a curl command
create_curl_request() {
  echo "curl -X 'POST' \\
  'http://localhost:8000/tasks/' \\
  -H 'accept: application/json' \\
  -H 'Content-Type: application/json' \\
  -d '{ \"code\": \"$1\" }'"
}

# 1. Return a number
create_curl_request "function returnNumber() { return 42; } returnNumber();"

# 2. Return a string
create_curl_request "function returnString() { return 'Hello, World!'; } returnString();"

# 3. Return an array
create_curl_request "function returnArray() { return [1, 2, 3, 4]; } returnArray();"

# 4. Return an object
create_curl_request "function returnObject() { return { name: 'Alice', age: 25 }; } returnObject();"

# 5. Return a boolean
create_curl_request "function returnBoolean() { return true; } returnBoolean();"

# 6. Return a sum
create_curl_request "function returnSum() { return 5 + 10; } returnSum();"

# 7. Return a subtraction
create_curl_request "function returnSubtraction() { return 20 - 5; } returnSubtraction();"

# 8. Return a multiplication
create_curl_request "function returnMultiplication() { return 4 * 6; } returnMultiplication();"

# 9. Return a division
create_curl_request "function returnDivision() { return 100 / 5; } returnDivision();"

# 10. Return a string length
create_curl_request "function returnStringLength() { return 'JavaScript'.length; } returnStringLength();"

# 11. Return a random number
create_curl_request "function returnRandom() { return Math.random(); } returnRandom();"

# 12. Return a rounded number
create_curl_request "function returnRounded() { return Math.round(4.7); } returnRounded();"

# 13. Return a power
create_curl_request "function returnPower() { return Math.pow(2, 3); } returnPower();"

# 14. Return the square root
create_curl_request "function returnSqrt() { return Math.sqrt(16); } returnSqrt();"

# 15. Return a string to uppercase
create_curl_request "function returnUpperCase() { return 'hello'.toUpperCase(); } returnUpperCase();"

# 16. Return a string to lowercase
create_curl_request "function returnLowerCase() { return 'HELLO'.toLowerCase(); } returnLowerCase();"

# 17. Return the first character of a string
create_curl_request "function returnFirstChar() { return 'hello'.charAt(0); } returnFirstChar();"

# 18. Return the last character of a string
create_curl_request "function returnLastChar() { return 'hello'.charAt('hello'.length - 1); } returnLastChar();"

# 19. Return the index of a character
create_curl_request "function returnCharIndex() { return 'hello'.indexOf('e'); } returnCharIndex();"

# 20. Return a string with spaces trimmed
create_curl_request "function returnTrimmedString() { return '  hello  '.trim(); } returnTrimmedString();"

# 21. Return a reversed string
create_curl_request "function returnReversedString() { return 'hello'.split('').reverse().join(''); } returnReversedString();"

# 22. Return a simple object from a function
create_curl_request "function returnSimpleObject() { return { key: 'value' }; } returnSimpleObject();"

# 23. Return a concatenated string
create_curl_request "function returnConcatenated() { return 'Hello, ' + 'World!'; } returnConcatenated();"

# 24. Return a string with template literals
create_curl_request "function returnTemplateLiteral() { return \`Hello, \${'World'}!\`; } returnTemplateLiteral();"

# 25. Return the current date
create_curl_request "function returnCurrentDate() { return new Date(); } returnCurrentDate();"

# 26. Return the current year
create_curl_request "function returnCurrentYear() { return new Date().getFullYear(); } returnCurrentYear();"

# 27. Return the current month
create_curl_request "function returnCurrentMonth() { return new Date().getMonth() + 1; } returnCurrentMonth();"

# 28. Return the current day
create_curl_request "function returnCurrentDay() { return new Date().getDate(); } returnCurrentDay();"

# 29. Return the current time
create_curl_request "function returnCurrentTime() { return new Date().toLocaleTimeString(); } returnCurrentTime();"

# 30. Return a boolean check
create_curl_request "function returnIsEven() { return 10 % 2 === 0; } returnIsEven();"

# 31. Return an even number check
create_curl_request "function returnEvenCheck() { return 4 % 2 === 0; } returnEvenCheck();"

# 32. Return an odd number check
create_curl_request "function returnOddCheck() { return 5 % 2 !== 0; } returnOddCheck();"

# 33. Return the factorial of a number
create_curl_request "function returnFactorial() { let num = 5; let result = 1; for (let i = 1; i <= num; i++) { result *= i; } return result; } returnFactorial();"

# 34. Return a number squared
create_curl_request "function returnSquared() { return 5 * 5; } returnSquared();"

# 35. Return a reversed array
create_curl_request "function returnReversedArray() { return [1, 2, 3].reverse(); } returnReversedArray();"

# 36. Return a sorted array
create_curl_request "function returnSortedArray() { return [3, 1, 2].sort(); } returnSortedArray();"

# 37. Return a random integer between 1 and 10
create_curl_request "function returnRandomInt() { return Math.floor(Math.random() * 10) + 1; } returnRandomInt();"

# 38. Return a date formatted to string
create_curl_request "function returnFormattedDate() { return new Date().toLocaleDateString(); } returnFormattedDate();"

# 39. Return a string with numbers replaced
create_curl_request "function returnReplacedString() { return 'hello 123'.replace('123', 'world'); } returnReplacedString();"

# 40. Return a string split by spaces
create_curl_request "function returnSplitString() { return 'hello world'.split(' '); } returnSplitString();"

# 41. Return a string without vowels
create_curl_request "function returnWithoutVowels() { return 'hello'.replace(/[aeiou]/gi, ''); } returnWithoutVowels();"

# 42. Return the maximum number
create_curl_request "function returnMax() { return Math.max(1, 2, 3, 4, 5); } returnMax();"

# 43. Return the minimum number
create_curl_request "function returnMin() { return Math.min(1, 2, 3, 4, 5); } returnMin();"

# 44. Return the absolute value
create_curl_request "function returnAbsolute() { return Math.abs(-5); } returnAbsolute();"

# 45. Return a string with an appended word
create_curl_request "function returnAppendedString() { return 'hello'.concat(' world'); } returnAppendedString();"

# 46. Return the remainder of division
create_curl_request "function returnRemainder() { return 10 % 3; } returnRemainder();"

# 47. Return a negative number check
create_curl_request "function returnNegativeCheck() { return -5 < 0; } returnNegativeCheck();"

# 48. Return the square of a number
create_curl_request "function returnSquaredNumber() { return Math.pow(5, 2); } returnSquaredNumber();"

# 49. Return the sum of numbers in an array
create_curl_request "function returnArraySum() { return [1, 2, 3, 4].reduce((acc, val) => acc + val, 0); } returnArraySum();"

# 50. Return the character code of a string
create_curl_request "function returnCharCode() { return 'A'.charCodeAt(0); } returnCharCode();"
