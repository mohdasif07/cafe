module ApplicationHelper
  SITE_NAME = "Cozy Cafe".freeze
  SITE_TAGLINE = "Coffee • Food • Good Vibes".freeze
  SITE_ADDRESS_LINE1 = "8834 E 34 Rd".freeze
  SITE_ADDRESS_LINE2 = "Cadillac, MI 49601".freeze
  SITE_ADDRESS_LINE3 = "USA".freeze
  SITE_PHONE = "+1 (568) 828-9017".freeze
  SITE_PHONE_HREF = "tel:+15688289017".freeze
  SITE_FULL_ADDRESS = "8834 E 34 Rd, Cadillac, MI 49601, USA".freeze

  DEFAULT_DESCRIPTION = "Visit Cozy Cafe in Cadillac, MI for freshly brewed coffee, delicious food, pastries and a cozy atmosphere. Perfect for coffee, meals, work and relaxing.".freeze

  # High-quality Unsplash café photography (optimized query params)
  IMAGES = {
    hero: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=1920&q=80",
    about: "https://images.unsplash.com/photo-1554118811-1e0d58224f24?auto=format&fit=crop&w=1400&q=80",
    cappuccino: "https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=800&q=80",
    club_sandwich: "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?auto=format&fit=crop&w=800&q=80",
    creamy_pasta: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=800&q=80",
    chocolate_cake: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80",
    gallery: [
      "https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1511920170033-f8396924c348?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1493857671505-72967e2e2760?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1559305616-3f99cd43e353?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=900&q=80",
      "https://images.unsplash.com/photo-1559925393-8be0ec4767c8?auto=format&fit=crop&w=900&q=80"
    ]
  }.freeze

  POPULAR_PICKS = [
    { name: "Cappuccino", description: "Smooth, rich and classic.", price: "$3.50", image: :cappuccino, alt: "Cappuccino with latte art" },
    { name: "Club Sandwich", description: "Fresh, tasty and satisfying.", price: "$7.50", image: :club_sandwich, alt: "Club sandwich on a plate" },
    { name: "Creamy Pasta", description: "Rich, flavorful and comforting.", price: "$8.50", image: :creamy_pasta, alt: "Bowl of creamy pasta" },
    { name: "Chocolate Cake", description: "The perfect sweet ending.", price: "$4.50", image: :chocolate_cake, alt: "Slice of chocolate cake" }
  ].freeze

  MENU_PASTRIES = [
    { name: "Butter Croissant", price: "$200" },
    { name: "Chocolate Croissant", price: "$500" },
    { name: "Cinnamon Roll", price: "$300" },
    { name: "Banana Bread Slice", price: "$1,000" },
    { name: "Blueberry Muffin", price: "$1,200" },
    { name: "Cheese Danish", price: "$1,400" },
    { name: "Toast & Jam", price: "$900" },
    { name: "Pancake Stack", price: "$800" }
  ].freeze

  MENU_SAVORY = [
    { name: "Club Sandwich", price: "$500" },
    { name: "Chicken Sandwich", price: "$200" },
    { name: "Veggie Sandwich", price: "$100" },
    { name: "Beef Burger", price: "$500" },
    { name: "Chicken Burger", price: "$800" },
    { name: "French Fries", price: "$500" },
    { name: "Meat Pie", price: "$800" },
    { name: "Sausage Roll", price: "$700" },
    { name: "Spring Rolls", price: "$200" }
  ].freeze

  def page_title(custom = nil)
    custom.presence || content_for(:title).presence || "#{SITE_NAME} | Coffee, Food & Cozy Atmosphere in Cadillac, MI"
  end

  def page_description
    content_for(:meta_description).presence || DEFAULT_DESCRIPTION
  end

  def cafe_image(key)
    IMAGES[key]
  end

  def nav_link_to(label, path, **options)
    classes = ["site-nav__link"]
    classes << "is-active" if current_page?(path)
    link_to label, path, class: classes.join(" "), **options
  end

  def maps_embed_url
    query = ERB::Util.url_encode(SITE_FULL_ADDRESS)
    "https://maps.google.com/maps?q=#{query}&output=embed"
  end

  def structured_data_json
    {
      "@context": "https://schema.org",
      "@type": "CafeOrCoffeeShop",
      name: SITE_NAME,
      description: DEFAULT_DESCRIPTION,
      telephone: SITE_PHONE,
      address: {
        "@type": "PostalAddress",
        streetAddress: SITE_ADDRESS_LINE1,
        addressLocality: "Cadillac",
        addressRegion: "MI",
        postalCode: "49601",
        addressCountry: "US"
      },
      url: request.base_url,
      servesCuisine: "Coffee, Breakfast, Lunch, Pastries",
      priceRange: "$$",
      openingHoursSpecification: {
        "@type": "OpeningHoursSpecification",
        description: "Opening hours placeholder — confirm with the café"
      }
    }.to_json.html_safe
  end
end
