// Test application for propagate-merger
console.log('Hello from propagate-merger test application!');

function calculateSum(a, b) {
  return a + b;
}

function greetUser(name) {
  return \`Hello, \${name}!\`;
}

// Export functions for testing
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    calculateSum,
    greetUser
  };
}

// Run if this is the main file
if (require.main === module) {
  console.log(calculateSum(5, 3));
  console.log(greetUser('World'));
}

function developmentFeature1() { return 'dev feature 1'; }
function developmentFeature2() { return 'dev feature 2'; }
function developmentFeature3() { return 'dev feature 3'; }
function developmentFeature4() { return 'dev feature 4'; }
