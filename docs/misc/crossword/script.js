async function findMatches() {
  const query = document.getElementById("query").value.toLowerCase();
  const exclude = document.getElementById("exclude").value.toLowerCase();
  const response = await fetch("words.txt");
  const text = await response.text();
  const words = text.split("\n");
  const matches = find_matches(words, query, exclude);
  document.getElementById("matches").innerText = matches.join(", ");
}
function find_matches(words, query, exclude) {
  query = query.replace(/\*/g, ".").trim();
  const matches = [];
  const lwords = [];
  for (const word of words) {
    if (word.length === query.length) {
      lwords.push(word);
    }
  }
  for (const word of lwords) {
    if (new RegExp(query).test(word)) {
      matches.push(word);
    }
  }
  if (exclude) {
    const excludeChars = [...new Set(exclude.split(""))];
    return matches.filter(
      (word) => !excludeChars.some((char) => word.includes(char)),
    );
  }
  return matches;
}
document.getElementById("query").addEventListener("keyup", function (event) {
  if (event.key === "Enter") {
    findMatches();
  }
});
document.getElementById("exclude").addEventListener("keyup", function (event) {
  if (event.key === "Enter") {
    findMatches();
  }
});
