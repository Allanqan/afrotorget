puts "Cleaning database..."
Rating.destroy_all
Bookmark.destroy_all
Advert.destroy_all
Product.destroy_all
ProductCategory.destroy_all
Company.destroy_all
CompanyType.destroy_all
Blog.destroy_all
User.destroy_all
UserCategory.destroy_all

puts "Creating user categories..."
individual = UserCategory.create\!(name: "Individual", description: "Personal account")
business   = UserCategory.create\!(name: "Business", description: "Business account")

puts "Creating company types..."
restaurant  = CompanyType.create\!(name: "Restaurant", description: "African food and dining")
music       = CompanyType.create\!(name: "Music & Entertainment", description: "DJs, musicians, events")
beauty      = CompanyType.create\!(name: "Beauty & Hair", description: "African hair salons and beauty services")
fashion     = CompanyType.create\!(name: "Fashion", description: "African clothing and accessories")
consulting  = CompanyType.create\!(name: "Consulting", description: "Business and professional services")

puts "Creating users..."
admin = User.create\!(
  email: "demo@afrotorget.no",
  password: "password123",
  first_name: "Demo",
  last_name: "Admin",
  user_category: individual
)
biz_user = User.create\!(
  email: "business@afrotorget.no",
  password: "password123",
  first_name: "Amara",
  last_name: "Diallo",
  user_category: business
)

puts "Creating product categories..."
food_cat    = ProductCategory.create\!(name: "African Food & Ingredients")
fashion_cat = ProductCategory.create\!(name: "African Fashion")
music_cat   = ProductCategory.create\!(name: "Music & Media")
art_cat     = ProductCategory.create\!(name: "Art & Crafts")

puts "Creating companies..."
Company.create\!([
  {
    name: "Mama Africa Restaurang",
    description: "Authentic West African cuisine in the heart of Oslo. Jollof rice, egusi soup, suya grilled meats.",
    size: 15,
    location: "Grunerloekka, Oslo",
    favorite: true,
    user: biz_user,
    company_type: restaurant
  },
  {
    name: "Afro Hair Studio",
    description: "Expert natural hair care, braiding, locs, and weaves. Specialising in all African hair textures.",
    size: 4,
    location: "Majorstuen, Oslo",
    favorite: false,
    user: biz_user,
    company_type: beauty
  },
  {
    name: "Lagos Beats Norway",
    description: "DJ booking, Afrobeats events, and live music experiences across Scandinavia.",
    size: 8,
    location: "Sentrum, Oslo",
    favorite: true,
    user: biz_user,
    company_type: music
  },
  {
    name: "Kente & Co",
    description: "Traditional and contemporary African fashion -- kente, ankara, and dashiki for all occasions.",
    size: 3,
    location: "Frogner, Oslo",
    favorite: false,
    user: biz_user,
    company_type: fashion
  },
  {
    name: "Pan-African Consulting AS",
    description: "Business consulting, legal translation, and immigration advisory for the African community in Norway.",
    size: 6,
    location: "Nydalen, Oslo",
    favorite: false,
    user: biz_user,
    company_type: consulting
  }
])

puts "Creating blog posts..."
Blog.create\!([
  {
    title: "Afrobeats goes mainstream in Norway",
    body: "The Afrobeats wave has reached Norwegian shores in a big way. From Oslo clubs to Spotify charts, Nigerian and Ghanaian artists are dominating playlists across Scandinavia. We speak to the DJs and promoters making it happen.",
    image: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800",
    user: admin
  },
  {
    title: "Starting a business in Norway as an African immigrant",
    body: "Norway ranks among the easiest countries in the world to register a business. Here is a step-by-step guide specifically for African entrepreneurs navigating Altinn, Bronnoysundregistrene, and the Norwegian tax system.",
    image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=800",
    user: admin
  },
  {
    title: "The best African restaurants in Oslo -- 2024 guide",
    body: "From Ethiopian injera to Nigerian suya and Senegalese thieboudienne, Oslo's African food scene has never been more vibrant. Our guide covers the must-visit spots across the city.",
    image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800",
    user: biz_user
  }
])

puts "Creating products..."
Product.create\!([
  {
    name: "Ankara Print Maxi Dress",
    description: "Handmade ankara wax print maxi dress. Available in multiple patterns. Made to order.",
    price: 850,
    location: "Oslo",
    favorite: true,
    user: biz_user,
    product_category: fashion_cat
  },
  {
    name: "Suya Spice Mix (500g)",
    description: "Authentic suya yaji spice blend imported from Lagos. Perfect for grilling meats.",
    price: 120,
    location: "Oslo",
    favorite: false,
    user: biz_user,
    product_category: food_cat
  },
  {
    name: "Afrobeats DJ Mix Vol. 12",
    description: "2-hour non-stop Afrobeats & Amapiano mix by DJ Demure. Digital download.",
    price: 75,
    location: "Oslo",
    favorite: true,
    user: biz_user,
    product_category: music_cat
  }
])

puts "Creating ratings..."
Product.all.each do |product|
  Rating.create\!(score: rand(4..5), description: "Great quality, fast delivery\!", product: product)
end

puts "Seeding complete\!"
puts "  Users: #{User.count} | Companies: #{Company.count} | Blogs: #{Blog.count} | Products: #{Product.count}"
puts "  Demo login: demo@afrotorget.no / password123"
