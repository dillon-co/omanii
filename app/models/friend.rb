require 'plivo'
class Friend < ApplicationRecord
  include Plivo
  has_many :friendships
  has_many :users, through: :friendships

  def send_message(body: nil)
    message = Message.all.sample
    users_list = "#{self.users.all.map(&:first_name).first(3).join(",")} and #{self.users.all.count - 3} more"
    unless body
      client = RestClient.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
      message_created = client.messages.create(
        '+14352529826',
        [self.number],
        "Hey #{self.first_name.titleize},\n #{message.body} \n\n-#{self.users.email}\n\n\nSpread the love.\nwww.omanii.com"
      )
    end
  end

  def self.create_masters_friends
    friend_list = [
      {
      first_name: "christian",
      last_name: "Russell",
      number: "+1"
    },{
      first_name: "Rocco",
      last_name: "Nichols",
      number: "+1"
    },{
      first_name: "Elias",
      last_name: "Jessop",
      number: "+1"
    },  {
      first_name: "Wyatt",
      last_name: "Cooper",
      number: "+1"
    },{
      first_name: "Aidan",
      last_name: "Brown",
      number: "+1"
    },{
      first_name: "Jake",
      last_name: "Yorgason",
      number: "+1"
    },{
      first_name: "Austin",
      last_name: "Sikich",
      number: "+1"
    },{
      first_name: "Austin",
      last_name:"Mcculoch",
      number: "+1"
    },{
      first_name: "Ian",
      last_name: "Harris",
      number: "+1"
    },{
      first_name: "Daniel",
      last_name:"Robbinson",
      number: "+1"
    },{
      first_name: "Chris",
      last_name: "Bruce",
      number: "+1"
    },{
      first_name: "Michael",
      last_name: "Buckley",
      number: "+1"
    },{
      first_name: "Curtis",
      last_name: "Adams",
      number: "+1"
    },{
      first_name: "Brock",
      last_name: "Adams",
      number: "+1"
    },{
      first_name: "Torrie",
      last_name: "Thomas",
      number: "+1"
    },{
      first_name: "Sierra",
      last_name: "Goulding",
      number: "+1"
    },{
      first_name: "Matt",
      last_name: "Harmon",
      number: "+1"
    },{
      first_name: "Jojo",
      last_name: "Halling",
      number: "+1"
    },{
      first_name: "Devin",
      last_name: "Horning",
      number: "+1"
    },{
      first_name: "Clay",
      last_name: "Harris",
      number: "+1"
    },{
      first_name: "Wendy",
      last_name: "Bruce",
      number: "+1"
    },{
      first_name: "Louis",
      last_name: "Bird",
      number: "+1"
    },{
      first_name: "Taylor",
      last_name: "Mott",
      number: "+1"
    },{
      first_name: "Ken",
      last_name: "Duhmmel",
      number: "+1"
    },{
      first_name: "Coulette",
      last_name: "Green",
      number: "+1"
    },{
      first_name: "Mckinley",
      last_name: "Stauffer",
      number: "+1"
    },{
      first_name: "Cole",
      last_name: "Holt",
      number: "+1"
    },{
      first_name: "Jordan",
      last_name: "Holt",
      number: "+1"
    },{
      first_name: "Patrick",
      last_name: "Newman",
      number: "+1"
    },{
      first_name: "Danielle",
      last_name: "Newman",
      number: "+1"
    },{
      first_name: "Jeff",
      last_name: "Johnson",
      number: "+1"
    },{
      first_name: "Tricia",
      last_name: "Stauffer",
      number: "+1"
    },{
      first_name: "Isa",
      last_name: "Shreeve",
      number: "+1"
    },{
      first_name: "Caleb",
      last_name: "Shreeve",
      number: "+1"
    },{
      first_name: "Brayden",
      last_name: "Manning",
      number: "+1"
    },{
      first_name: "Cameron",
      last_name: "Lidell",
      number: "+1"
    },{
      first_name: "Danielle",
      last_name: "Giangrasso",
      number: "+1"
    },{
      first_name: "Miles",
      last_name: "Riting",
      number: "+1"
    },{
      first_name: "Jeff",
      last_name: "Rowe",
      number: "+1"
    },{
      first_name: "Doug",
      last_name: "Rowe",
      number: "+1"
    },{
      first_name: "Jeff",
      last_name: "Scott",
      number: "+1"
    },{
      first_name: "Alton",
      last_name: "Alexander",
      number: "+1"
    },{
      first_name: "Alexander",
      last_name: "Alguire",
      number: "+1"
    },{
      first_name: "Ryan",
      last_name: "Sannar",
      number: "+1"
    },{
      first_name: "Christian",
      last_name: "Kenworthy",
      number: "+1"
    },{
      first_name: "Gabe",
      last_name: "Kenworthy",
      number: "+1"
    },{
      first_name: "Carter",
      last_name: "Greene",
      number: "+1"
    },{
      first_name: "Jackson",
      last_name: "Greene",
      number: "+1"
    },{
      first_name: "Han",
      last_name: "Calder",
      number: "+1"
    },{
      first_name: "CJ",
      last_name: "Batista",
      number: "+1"
    },{
      first_name: "Mason",
      last_name: "Moody",
      number: "+1"
    },{
      first_name: "Landon",
      last_name: "Morris",
      number: "+1"
    },{
      first_name: "Alex",
      last_name: "Loertscher",
      number: "+1"
    },{
      first_name: "Colton",
      last_name: "Yorgason",
      number: "+1"
    },{
      first_name: "Gabe",
      last_name: "Wood",
      number: "+1"
    },{
      first_name: "Dallas",
      last_name: "Hielman",
      number: "+1"
    },{
      first_name: "Jacob",
      last_name: "Clark",
      number: "+1"
    },{
      first_name: "Seth",
      last_name: "Hampton",
      number: "+1"
    },{
      first_name: "Kaipo",
      last_name: "Tangaloa",
      number: "+1"
    },{
      first_name: "Drew",
      last_name: "James",
      number: "+1"
    },{
      first_name: "Peter",
      last_name: "Duce",
      number: "+1"
    },{
      first_name: "Dillon",
      last_name: "Freeze",
      number: "+1"
    },{
      first_name: "David",
      last_name: "Harris",
      number: "+1"
    },{
      first_name: "Ahseante",
      last_name: "",
      number: "+1"
    },{
      first_name: "Travis",
      last_name: "Flinton",
      number: "+1"
    },{
      first_name: "Patrick",
      last_name: "Adams",
      number: "+1"
    },{
      first_name: "Cassie",
      last_name: "Ford",
      number: "+1"
    },{
      first_name: "Brooke",
      last_name: "Alius",
      number: "+1"
    },{
      first_name: "Mike",
      last_name: "Fox",
      number: "+1"
    },{
      first_name: "Tyson",
      last_name: "Ostler",
      number: "+1"
    },{
      first_name: "David",
      last_name: "Steeby",
      number: "+1"
    },{
      first_name: "",
      last_name: "",
      number: "+1"
    },{
      first_name: "Bryson",
      last_name: "Jones",
      number: "+1"
    },{
      first_name: "Ethan",
      last_name: "Hilton",
      number: "+1"
    },{
      first_name: "Adam",
      last_name: "Turley",
      number: "+1"
    },{
      first_name: "Jimmy",
      last_name: "Bay",
      number: "+1"
    },{
      first_name: "Tanner",
      last_name: "Thorne",
      number: "+1"
    },{
      first_name: "Grant",
      last_name: "Jones",
      number: "+1"
    },{
      first_name: "Chris",
      last_name: "Harmon",
      number: "+1"
    },{
      first_name: "Tanner",
      last_name: "Boden",
      number: "+1"
    },{
      first_name: "Trace",
      last_name: "Nielson",
      number: "+1"
    },{
      first_name: "Zoe",
      last_name: "Bourg",
      number: "+1"
    },{
      first_name: "Connor",
      last_name: "Day",
      number: "+1"
    },{
      first_name: "Justice",
      last_name: "McGnarly",
      number: "+1"
    },{
      first_name: "Jordan",
      last_name: "Brady",
      number: "+1"
    },{
      first_name: "Caleb",
      last_name: "Lystrup",
      number: "+1"
    },{
      first_name: "Nina",
      last_name: "Porobich",
      number: "+1"
    },{
      first_name: "Dan",
      last_name: "Hyatt",
      number: "+1"
    },{
      first_name: "Jmack",
      last_name: "",
      number: "+1"
    },{
      first_name: "Meg",
      last_name: "Warnock",
      number: "+1"
    },{
      first_name: "Justin",
      last_name: "Hielman",
      number: "+1"
    },{
      first_name: "Clay",
      last_name: "Osborn",
      number: "+1"
    },{
      first_name: "Sawyer",
      last_name: "Carpenter",
      number: "+1"
    },{
      first_name: "Tennyson",
      last_name: "Lowrey",
      number: "+1"
    },{
      first_name: "Sam",
      last_name: "Collins",
      number: "+1"
    },{
      first_name: "Kyle",
      last_name: "Alverado",
      number: "+1"
    },{
      first_name: "Cody",
      last_name: "Salyer",
      number: "+1"
    },{
      first_name: "Landon",
      last_name: "Jarvis",
      number: "+1"
    },{
      first_name: "Joe",
      last_name: "Babbel",
      number: "+1"
    },{
      first_name: "Wyatt",
      last_name: "Berry",
      number: "+1"
    },{
      first_name: "Gentry",
      last_name: "Ojomo",
      number: "+1"
    },{
      first_name: "Adrienne",
      last_name: "Vigil",
      number: "+1"
    },{
      first_name: "Sarina",
      last_name: "Montcastle",
      number: "+1"
    },{
      first_name: "Madison",
      last_name: "Darby-Mccure",
      number: "+1"
    },{
      first_name: "Nick",
      last_name: "Windslow",
      number: "+1"
    },{
      first_name: "Chris",
      last_name: "Collinsworth",
      number: "+1"
    },{
      first_name: "Olivia",
      last_name: "Haglund",
      number: "+1"
    },{
      first_name: "Josh",
      last_name: "Ylst",
      number: "+1"
    },{
      first_name: "Bryce",
      last_name: "Conneley",
      number: "+1"
    },{
      first_name: "Dane",
      last_name: "Gollero",
      number: "+1"
    },{
      first_name: "Quintin",
      last_name: "Adams",
      number: "+1"
    },{
      first_name: "Kathering",
      last_name: "Muerta",
      number: "+1"
    },{
      first_name: "Jeremy",
      last_name: "Carpinter",
      number: "+1"
    },{
      first_name: "Kelson",
      last_name: "Erwin",
      number: "+1"
    },{
      first_name: "Keaton",
      last_name: "Paul",
      number: "+1"
    },{
      first_name: "David",
      last_name: "Steeby",
      number: "+1"
    },{
      first_name: "Dan",
      last_name: "Wright",
      number: "+1"
    },{
      first_name: "Mike",
      last_name: "Fidel",
      number: "+1"
    },{
      first_name: "Jacob",
      last_name: "Bird",
      number: "+1"
    },{
      first_name: "Lindy",
      last_name: "Clegg",
      number: "+1"
    },{
      first_name: "Tyler",
      last_name: "Roberts",
      number: "+1"
    },{
      first_name: "Nick",
      last_name: "Carpenter",
      number: "+1"
    },{
      first_name: "Ben",
      last_name: "Doxey",
      number: "+1"
    }
  ]
    User.find_by(email: 'dilloncortez@gmail.com').friends.create(friend_list)
  end
end
