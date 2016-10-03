pronouns = [
    ["I", "I"],
    ["you", "you"],
    ["we", "we"],
    ["they", "they"],
    ["he", "he"],
    ["she", "she"],
    ["it", "it"]
]

pronouns.each do |word, pronoun|
    Subject.create!(word: word, pronoun: pronoun)
end

verbs_list = [
    ["have", "has", "having", "had", "had"],
    ["do", "does", "doing", "did", "done"],
    ["go", "goes", "going", "went", "gone"],
    ["say", "says", "saying", "said", "said"],
    ["get", "gets", "getting", "got", "got"],
    ["make", "makes", "making", "made", "made"],
    ["take", "takes", "taking", "took", "taken"],
    ["see", "sees", "seeing", "saw", "seen"],
    ["come", "comes", "coming", "came", "come"],
    ["think", "thinks", "thinking", "thought", "thought"],
    ["eat", "eats", "eating", "ate", "eaten"]
]

verbs_list.each do |word, present_simple, continuous, past_simple, past_participle|
    Verb.create!(word: word, present_simple: present_simple, continuous: continuous, past_simple: past_simple, past_participle: past_participle)
end

complements_list = [
    ["hard and fast", ""],
    ["a lot", ""],
    ["money"],
    ["at home", ""],
    ["all day", ""],
    ["next year"],
    ["on the toilet"],
    ["pizza", "it"],
    ["things", "them"],
    ["on Monday"],
    ["when I was 15"],
]

complements_list.each do |word, pronoun|
    Complement.create!(word: word, pronoun: pronoun)
end