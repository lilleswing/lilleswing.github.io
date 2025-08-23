async function findMatches() {
  const query = document.getElementById("query").value.toLowerCase();
  const exclude = document.getElementById("exclude").value.toLowerCase();
  const include = document.getElementById("include").value.toLowerCase();
  const response = await fetch("words.txt");
  const text = await response.text();
  const words = text.split("\n");
  const matches = find_matches(words, query, exclude, include);
  document.getElementById("matches").innerText = matches.join(", ");
}
function find_matches(words, query, exclude, include) {
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
  let filteredMatches = matches;
  if (exclude) {
    const excludeChars = [...new Set(exclude.split(""))];
    filteredMatches = filteredMatches.filter(
      (word) => !excludeChars.some((char) => word.includes(char)),
    );
  }
  if (include) {
    const includeChars = [...new Set(include.split(""))];
    filteredMatches = filteredMatches.filter((word) =>
      includeChars.every((char) => word.includes(char)),
    );
  }
  return filteredMatches;
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
document.getElementById("include").addEventListener("keyup", function (event) {
  if (event.key === "Enter") {
    findMatches();
  }
});
