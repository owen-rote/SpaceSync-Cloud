#!/bin/bash

# Function to create a POST request with a curl command
create_curl_request() {
  curl -X 'POST' \
    'http://localhost:8000/tasks/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d "{ \"code\": \"$1\" }"
}

# 1. Large prime number check
create_curl_request "function isPrime(n) { if (n <= 1) return false; for (let i = 2; i * i <= n; i++) { if (n % i === 0) return false; } return true; } isPrime(982451653);"

# 2. Fibonacci (recursive, heavy)
create_curl_request "function fib(n) { return n <= 1 ? n : fib(n - 1) + fib(n - 2); } fib(35);"

# 3. Sort 10,000 random numbers
create_curl_request "function sortLargeArray() { const arr = Array.from({ length: 10000 }, () => Math.random()); return arr.sort(); } sortLargeArray();"

# 4. Matrix multiplication (100x100)
create_curl_request "function matrixMultiply(n) { const A = [], B = [], C = []; for (let i = 0; i < n; i++) { A[i] = []; B[i] = []; C[i] = []; for (let j = 0; j < n; j++) { A[i][j] = Math.random(); B[i][j] = Math.random(); C[i][j] = 0; } } for (let i = 0; i < n; i++) { for (let j = 0; j < n; j++) { for (let k = 0; k < n; k++) { C[i][j] += A[i][k] * B[k][j]; } } } return C[0][0]; } matrixMultiply(100);"

# 5. Compute SHA-256 hash (simulated, not crypto-secure)
create_curl_request "function fakeHash(str) { let hash = 0; for (let i = 0; i < str.length; i++) { hash = ((hash << 5) - hash) + str.charCodeAt(i); hash |= 0; } return hash; } fakeHash('This is a long string used for hashing test');"

# 6. Generate and sum 1 million random numbers
create_curl_request "function sumLargeArray() { let total = 0; for (let i = 0; i < 1e6; i++) total += Math.random(); return total; } sumLargeArray();"

# 7. Monte Carlo Pi estimation
create_curl_request "function estimatePi(samples) { let inside = 0; for (let i = 0; i < samples; i++) { const x = Math.random(), y = Math.random(); if (x * x + y * y <= 1) inside++; } return (4 * inside / samples); } estimatePi(1e6);"

# 8. Recursive factorial (large number)
create_curl_request "function factorial(n) { return n <= 1 ? 1 : n * factorial(n - 1); } factorial(25);"

# 9. Deep nested object creation
create_curl_request "function deepObject(depth) { let obj = {}; let current = obj; for (let i = 0; i < depth; i++) { current['level' + i] = {}; current = current['level' + i]; } return obj; } deepObject(1000);"

# 10. Simulate basic neural net layer (dot product)
create_curl_request "function denseLayer(inputSize, outputSize) { const input = Array.from({ length: inputSize }, () => Math.random()); const weights = Array.from({ length: outputSize }, () => Array.from({ length: inputSize }, () => Math.random())); const output = Array(outputSize).fill(0); for (let i = 0; i < outputSize; i++) { for (let j = 0; j < inputSize; j++) { output[i] += weights[i][j] * input[j]; } } return output; } denseLayer(512, 128);"
# 11. Generate first 10,000 prime numbers
create_curl_request "function generatePrimes() {
  const primes = []; let num = 2;
  while (primes.length < 10000) {
    if (primes.every(p => num % p !== 0)) primes.push(num);
    num++;
  }
  return primes;
} generatePrimes();"

# 12. Calculate large Fibonacci number (recursive with memo)
create_curl_request "function fib(n, memo = {}) {
  if (n <= 1) return n;
  if (memo[n]) return memo[n];
  return memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
} fib(35);"

# 13. Multiply large matrices
create_curl_request "function multiplyMatrices() {
  const size = 100; const A = [], B = [], C = [];
  for (let i = 0; i < size; i++) {
    A[i] = []; B[i] = []; C[i] = [];
    for (let j = 0; j < size; j++) {
      A[i][j] = Math.random(); B[i][j] = Math.random(); C[i][j] = 0;
    }
  }
  for (let i = 0; i < size; i++)
    for (let j = 0; j < size; j++)
      for (let k = 0; k < size; k++)
        C[i][j] += A[i][k] * B[k][j];
  return C[0][0];
} multiplyMatrices();"

# 14. SHA-256 hashing many times
create_curl_request "async function hashLoop() {
  let msg = new TextEncoder().encode('hello');
  for (let i = 0; i < 10000; i++) {
    msg = new Uint8Array(await crypto.subtle.digest('SHA-256', msg));
  }
  return Array.from(msg).slice(0, 5);
} hashLoop();"

# 15. Simulate particle motion
create_curl_request "function simulateParticles() {
  let particles = Array.from({ length: 10000 }, () => ({ x: 0, y: 0, vx: Math.random(), vy: Math.random() }));
  for (let t = 0; t < 100; t++) {
    particles = particles.map(p => ({ ...p, x: p.x + p.vx, y: p.y + p.vy }));
  }
  return particles[0];
} simulateParticles();"

# 16. Generate permutations of 9 elements
create_curl_request "function permute(arr) {
  const result = [];
  const helper = (current, rest) => {
    if (!rest.length) return result.push(current);
    for (let i = 0; i < rest.length; i++) {
      helper(current.concat(rest[i]), rest.slice(0, i).concat(rest.slice(i + 1)));
    }
  };
  helper([], arr);
  return result.length;
} permute([1,2,3,4,5,6,7,8,9]);"

# 17. Monte Carlo estimate of PI
create_curl_request "function monteCarloPI() {
  let inside = 0, total = 1000000;
  for (let i = 0; i < total; i++) {
    const x = Math.random(), y = Math.random();
    if (x * x + y * y <= 1) inside++;
  }
  return (4 * inside / total).toFixed(6);
} monteCarloPI();"

# 18. Pathfinding in a grid (brute-force DFS)
create_curl_request "function countPaths(n) {
  const dfs = (x, y) => (x === n && y === n) ? 1 : 0 +
    (x < n ? dfs(x + 1, y) : 0) +
    (y < n ? dfs(x, y + 1) : 0);
  return dfs(0, 0);
} countPaths(10);"

# 19. Matrix determinant (recursive)
create_curl_request "function determinant(m) {
  const n = m.length;
  if (n === 1) return m[0][0];
  if (n === 2) return m[0][0]*m[1][1] - m[0][1]*m[1][0];
  let det = 0;
  for (let i = 0; i < n; i++) {
    const sub = m.slice(1).map(r => r.filter((_, j) => j !== i));
    det += (i % 2 === 0 ? 1 : -1) * m[0][i] * determinant(sub);
  }
  return det;
} determinant([[1,2,3],[4,5,6],[7,8,9]]);"

# 20. Generate Mandelbrot set
create_curl_request "function mandelbrot(width, height) {
  const maxIter = 100; const output = [];
  for (let x = 0; x < width; x++) {
    for (let y = 0; y < height; y++) {
      let zx = 0, zy = 0;
      const cx = (x - width/2) / (width/4), cy = (y - height/2) / (height/4);
      let iter = 0;
      while (zx*zx + zy*zy < 4 && iter < maxIter) {
        const tmp = zx*zx - zy*zy + cx;
        zy = 2*zx*zy + cy;
        zx = tmp;
        iter++;
      }
      output.push(iter);
    }
  }
  return output.slice(0, 10);
} mandelbrot(100, 100);"
