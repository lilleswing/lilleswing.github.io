async function findMatches() {
  const query = document.getElementById("query").value;
  const response = await fetch("words.txt");
  const text = await response.text();
  const words = text.split("\n");
  const matches = find_matches(words, query);
  document.getElementById("matches").innerText = matches.join(", ");
}
function find_matches(words, query) {
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
  return matches;
}
document.getElementById("query").addEventListener("keyup", function (event) {
  if (event.key === "Enter") {
    findMatches();
  }
});
