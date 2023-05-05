class Word {
  String term;
  String def;
  Word(this.term, this.def);
}
typedef Words = Map<String, String>;
  
class Dictionary {
  Words dictionary;
  
  Dictionary(this.dictionary);
  
  void add(String term, String def) {
    if(dictionary[term] == null) {
      dictionary[term] = def;
      print("'$term' is Added!");
    } else {
      print("There is already '$term'");
    }

  }
  
  void get(String term) {
    if(dictionary[term] == null) {
      print("There is no '$term'");
    } else {
      print("'$term' means '${dictionary[term]}'");
    }
  }
  
  void delete(String term) {
    dictionary.remove(term);
    print("'$term' is Deleted!");
  }
  
  void update(String term, String def) {
    if(dictionary[term] == null) {
      print("There is no '$term'");
    } else {
      dictionary[term] = def;
      print("'$term' is Updated!");
    }
  }
  
  void showAll() {
    dictionary.forEach((key, value) => print("$key : $value"));
  }
  
  void count() {
    print("I have ${dictionary.length} words");
  }
  
  void upsert(String term, String def) {
    if(dictionary[term] == null) {
      add(term, def);
    } else {
      update(term, def);
    }
  }
  
  void exists(String term) {
    if(dictionary.containsKey(term)) {
      print("I have a word '$term'");
    } else {
      print("I don't have a word '$term'");
    }
  }
  
  void bulkAdd(List<Word> wordList) {
    for(Word word in wordList) {
      dictionary[word.term] = word.def;
    }
    print("${wordList.length} words are added");
  }
  
  void bulkDelete(List<String> wordList) {
    for(String word in wordList) {
      dictionary.remove(word);
    }
    print("${wordList.length} words are deleted");
  }
  
}

void main() {
  Words myDictionary = {};
  var test = Dictionary(myDictionary);
  
  test.add("seondal", "my name");
  test.get("seondal");
  test.upsert("nomad", "my teacher");
  test.upsert("seondal", "my nickname");
  test.exists("nomad");
  test.get("seondal");
  test.delete("seondal");
  test.get("seondal");
  test.bulkAdd([Word("kimchi", "delicious"), Word("chocolate", "also delicious")]);
  test.showAll();
  test.bulkDelete(["nomad", "kimchi"]);
  test.count();
}
