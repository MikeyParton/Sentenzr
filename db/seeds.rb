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
	["get", "gets", "getting", "got", "gotten"],
	["make", "makes", "making", "made", "made"],
	["take", "takes", "taking", "took", "taken"],
	["see", "sees", "seeing", "saw", "seen"],
	["come", "comes", "coming", "came", "come"],
	["think", "thinks", "thinking", "thought", "thought"],
	["eat", "eats", "eating", "ate", "eaten"]
]

# Seeding test for definitions and translations
#verb_entries = [
#	entry: {
#		word: ["have", "has", "having", "had", "had"],
#		definitions: [
#			{ def: [ "To possess or own something physically or even abstractly.", "What do you want to eat? We have pizza, 
#					pasta, chicken and salad."],
#				translation: [ "tener", "Poseer algo fisicamente o incluso abstractamente.", "Qué quieres comer? Tenemos 			pizza, pasta, pollo y ensalada" ]
#				},
#			{ def: ["To eat or drink something", "She had 2 glasses of wine at the party."],
#				translation: [ "tomar", "Comer o beber algo", "Ella tomó 2 vasos de vino el la fiesta" ] 
#				}
#		]
#	}
#]
#
#verb_entries.each do


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