ebay = Company.where(url: "ebay").first_or_create
ebay.update(
  name: "eBay",
  verified: true,
  headline: "eBay delivers one of the world's largest online marketplaces to customers via any connected device, connecting people with the things they need and love",
  location: "2065 Hamilton Avenue San Jose, CA 95125 United States",
  website: "http://www.ebayinc.com",
  founded_date: Date.parse("September 3rd, 1995"),
  about: "Founded in 1995 in San Jose, Calif., eBay Inc. (NASDAQ:EBAY) connects millions of buyers and sellers globally on a daily basis through eBay, the world's largest online marketplace, and PayPal, which enables individuals and businesses to securely, easily and quickly send and receive online payments.\n\nWe also reach millions through specialized marketplaces such as StubHub, the world's largest ticket marketplace, and eBay classifieds sites, which together have a presence in more than 1,000 cities around the world. For more information about the company and our global portfolio of online brands, visit http://www.ebaycareers.com/our-brands.aspx.\n\neBay Inc. is an equal opportunity employer, dedicated to workforce diversity.",
  looking_for: "Because we're pushing the boundaries of shopping as you know it. By incorporating real-time local inventory into the \"same old\" shopping experience, we not only give shoppers what they've been craving, but deliver retailers an unparalleled way to drive foot traffic into their stores.\n\nSo who are you? You're someone who wants to solve a real world problem and doesn't mind being disruptive in the process. You're someone who wants to directly impact millions of people and play a vital role in shaping the future of one of Silicon Valley's biggest icons: eBay. You're someone who values serious skills and funny titles. And, most importantly, you're someone who jumps on the opportunity to influence where we—as a company, as a team, and as thought leaders—go from here.\n\nReal-time local shopping is a bleeding edge challenge, one some believe is \"impossible\" to solve. But we're doing it. And what you've seen is just the beginning.",
  logo_image: "ebay.png",
  cover_photo_image: "ebay_cover_photo.jpg",
)

ebay_project = Project.find_by(uid: 16)
company_project = CompanyProject.where(project: ebay_project, company: ebay).first_or_create

mightyhive = Company.where(url: "mightyhive").first_or_create
mightyhive.update(
  name: "MightyHive",
  verified: true,
  headline: "Get more customers from your direct marketing",
  location: "321 11th St. San Francisco, CA 94103 United States",
  website: "http://www.mightyhive.com",
  founded_date: Date.parse("July 2012"),
  about: "MightyHive provides software and services to marketers, advertisers and agencies for activating existing internal business systems and intelligence tools to drive real-time online marketing campaigns.\n\nWe specialize in integrating to and activating data from Call Centers, Direct Mail Programs, CRM systems, Inventory Systems and other offline Enterprise class business systems to drive highly targeted real-time online marketing campaigns.\n\nLeverage your offline data and audience to power online channel audience reach.",
  looking_for: nil,
  logo_image: "mightyhive.png",
  cover_photo_image: "mightyhive_cover_photo.png",
)

mightyhive_project_1 = Project.find_by(uid: 28)
mightyhive_project_2 = Project.find_by(uid: 29)
mightyhive_project_3 = Project.find_by(uid: 30)
company_project_1 = CompanyProject.where(project: mightyhive_project_1, company: mightyhive).first_or_create
company_project_2 = CompanyProject.where(project: mightyhive_project_2, company: mightyhive).first_or_create
company_project_3 = CompanyProject.where(project: mightyhive_project_3, company: mightyhive).first_or_create

statricks = Company.where(url: "statricks").first_or_create
statricks.update(
  name: "Statricks",
  verified: true,
  headline: "Statricks is a web platform aimed at helping buyers & sellers of used goods save time while maximizing savings and profits",
  location: "3723 Haven Avenue Suite 123 Menlo Park, Ca 94025 United States",
  website: "http://www.statricks.com",
  founded_date: Date.parse("March 15th, 2010"),
  about: "Statricks is the easiest, most powerful tool for pricing used goods. We provide price trends so you can find the best deals when buying or maximize your return when selling.\n\nOur tool is designed to help buyers and sellers of used goods to get the most out of their transactions. Statricks is similar to Kelley Blue Book but for any item found in consumer goods markets - not just cars and trucks.",
  looking_for: nil,
  logo_image: "statricks.png",
  cover_photo_image: "statricks_cover_photo.png",
)

statricks_project_1 = Project.find_by(uid: 26)
statricks_project_2 = Project.find_by(uid: 27)
company_project_1 = CompanyProject.where(project: statricks_project_1, company: statricks).first_or_create
company_project_2 = CompanyProject.where(project: statricks_project_2, company: statricks).first_or_create

