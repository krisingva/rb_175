@results = [
  {number: 1, name: "chapter 1", id_num: "a1"},
  {number: 1, name: "chapter 1", id_num: "a2"},
  {number: 2, name: "chapter 2", id_num: "a1"},
]

@selected_chapters = @results.each_with_object([]) do |result, obj|
  obj << result[:name]
end.uniq

p @selected_chapters