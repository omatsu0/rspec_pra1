1 require 'rails_helper'
 2 
 3 RSpec.describe Note, type: :model do
 4   before do
 5     @user = User.create(
 6       first_name: "Joe",
 7       last_name:  "Tester",
 8       email:      "joetester@example.com",
 9       password:   "dottle-nouveau-pavilion-tights-furze",
10     )
11 
12     @project = @user.projects.create(
13       name: "Test Project",
14     )
15   end
16 
17   # ユーザー、プロジェクト、メッセージがあれば有効な状態であること
18   it "is valid with a user, project, and message" do
19     note = Note.new(
20       message: "This is a sample note.",
21       user: @user,
22       project: @project,
23     )
24     expect(note).to be_valid
25   end
26 
27   # メッセージがなければ無効な状態であること
28   it "is invalid without a message" do
29     note = Note.new(message: nil)
30     note.valid?
31     expect(note.errors[:message]).to include("can't be blank")
32   end
33 
34   # 文字列に一致するメッセージを検索する
35   describe "search message for a term" do
36     before do
37       @note1 = @project.notes.create(
38         message: "This is the first note.",
39         user: @user,
40       )
41       @note2 = @project.notes.create(
42         message: "This is the second note.",
43         user: @user,
44       )
45       @note3 = @project.notes.create(
46         message: "First, preheat the oven.",
47         user: @user,
48       )
49     end
50 
51     # 一致するデータが見つかるとき
52     context "when a match is found" do
53       # 検索文字列に一致するメモを返すこと
54       it "returns notes that match the search term" do
55         expect(Note.search("first")).to include(@note1, @note3)
56       end
57     end
58 
59     # 一致するデータが1件も見つからないとき
60     context "when no match is found" do
61       # 空のコレクションを返すこと
62       it "returns an empty collection" do
63         expect(Note.search("message")).to be_empty
64       end
65     end
66   end
67 end