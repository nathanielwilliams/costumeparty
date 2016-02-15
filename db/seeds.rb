Wrestler.create!(name: "Hulk Hogan",
                 image: File.open(File.join(Rails.root, '/test/images/hulk.jpg')),
                slogan: "What are you gonna do when hulkamania runs wild on you?")

Wrestler.create!(name: "Macho ManRandy Savage",
                 image: File.open(File.join(Rails.root, '/test/images/randy.jpg')),
                slogan: "OHHHHHHHHHHH YEAAHHHHHHHHHHH!")

Wrestler.create!(name: "Norm MacDonald",
                 image: File.open(File.join(Rails.root, '/test/images/norm.jpg')),
                slogan: "I am not a Wrestler")

Wrestler.create!(name: "Rowdy Roddy Piper",
                 image: File.open(File.join(Rails.root, '/test/images/roddy.jpg')),
                slogan: "Sooner or later, everybody pays the Piper!")

Wrestler.create!(name: "The Rock",
                 image: File.open(File.join(Rails.root, '/test/images/therock.jpg')),
                slogan: "Can you smellllllllllllll what The Rock is cookin'?!")

Wrestler.create!(name: "The Undertaker",
                 image: File.open(File.join(Rails.root, '/test/images/undertaker.jpg')),
                slogan: "You can not kill that which is already dead.")

Wrestler.create!(name: "Stone Cold Steve Austin",
                 image: File.open(File.join(Rails.root, '/test/images/austin.jpg')),
                slogan: "You can talk about your Psalms and your John 3:16. Well, Austin 3:16 says I just whooped your ass.")

User.create!(name:  "Nathaniel W",
             email: "nathaniel.williams@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             wrestler_id: 2)

User.create!(name:  "Jinny L",
           email: "jinesea.lewis@gmail.com",
           password:              "foobar",
           password_confirmation: "foobar",
           wrestler_id: 1)

Micropost.create!(user_id: 1,
                  content: "Nathaniel W has entered the ring! #ROYALRUMBLE #JINNYXXXI",
                  autopost: true)

Micropost.create!(user_id: 1,
                  content: "Nathaniel W is entering the ring as Randy Savage, and they are no longer available for selection. #JINNYXXXI",
                  autopost: true)

Micropost.create!(user_id: 2,
                  content: "Jinny L has entered the ring! #ROYALRUMBLE #JINNYXXXI",
                  autopost: true)

Micropost.create!(user_id: 2,
                  content: "Jinny L is entering the ring as Randy Savage, and they are no longer available for selection. #JINNYXXXI",
                  autopost: true)
