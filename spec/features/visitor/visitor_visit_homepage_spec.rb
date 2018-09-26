require 'rails_helper'

feature 'visitor visit homepage' do
  scenario 'successfully' do
    property_type = PropertyType.create(name: 'casa')
    region = Region.create(name: 'Florianópolis')
    property = Property.create(title: 'Casa de banho', 
                              description: 'Lugar maravilho para tomar banho',
                              maximum_guests: 5,
                              property_type: property_type,
                              region: region,
                              room_quantity: 2,
                              minimum_rent: 2,
                              maximum_rent: 10,
                              daily_rate: 199.99)

    visit root_path

    expect(page).to have_css('li', text: property.title)
    expect(page).to have_css('li', text: property.description)
    expect(page).to have_css('li', text: property.property_type.name)
    expect(page).to have_css('li', text: property.room_quantity)
    expect(page).to have_css('li', text: property.daily_rate)
  end

  scenario 'view property details' do 
      
    property_type = PropertyType.create!(name: 'casa')
    region = Region.create!(name: 'Florianópolis')
    property = Property.create!(title: 'Casa de banho', 
                              description: 'Lugar maravilho para tomar banho',
                              property_type: property_type,
                              region: region,
                              area: 60,  
                              room_quantity: 2,
                              accessibility: true, 
                              allow_pets: false,
                              allow_smokers: true, 
                              maximum_guests: 5, 
                              minimum_rent: 2,
                              maximum_rent: 10,
                              daily_rate: 199.99) 
                             
     visit root_path
     click_on 'Casa de banho'

      expect(page).to have_css('h1', text: property.title)
      expect(page).to have_css('p', text: property.description)
      expect(page).to have_css('li', text: property.property_type.name)
      expect(page).to have_css('li', text: property.region.name)
      expect(page).to have_css('li', text: property.area)
      expect(page).to have_css('li', text: property.room_quantity)
      expect(page).to have_css('li', text: 'Possui acessibilidade: Sim') 
      expect(page).to have_css('li', text: 'Aceita animais: Não')
      expect(page).to have_css('li', text: 'Aceita fumantes: Sim')
      expect(page).to have_css('li', text: property.maximum_guests)
      expect(page).to have_css('li', text: property.minimum_rent)
      expect(page).to have_css('li', text: property.maximum_rent)
      expect(page).to have_css('li', text: property.daily_rate)

  end

  scenario 'visitor view property by region' do

    property_type = PropertyType.create!(name: 'casa')
    region_florianopolis = Region.create!(name: 'Florianópolis')
    property_fl = Property.create!(title: 'Casa de banho', 
                              description: 'Lugar maravilho para tomar banho',
                              property_type: property_type,
                              region: region_florianopolis,
                              area: 60,  
                              room_quantity: 2,
                              accessibility: true, 
                              allow_pets: false,
                              allow_smokers: true, 
                              maximum_guests: 5, 
                              minimum_rent: 2,
                              maximum_rent: 10,
                              daily_rate: 199.99) 

    property_type = PropertyType.create!(name: 'apartamento')
    region_buzios = Region.create!(name: 'Búzios')
    property_bz = Property.create!(title: 'Apartamento Lindão', 
                              description: 'Lugar maravilho',
                              property_type: property_type,
                              region: region_buzios,
                              area: 60,  
                              room_quantity: 2,
                              accessibility: true, 
                              allow_pets: false,
                              allow_smokers: true, 
                              maximum_guests: 5, 
                              minimum_rent: 2,
                              maximum_rent: 10,
                              daily_rate: 199.99) 
                            
    

    visit root_path

    expect(page).to have_css('h2', text: 'Propriedades de Florianópolis')
    within("div#region-#{region_florianopolis.id}") do
      expect(page).to have_css('li', text: property_fl.title)
      expect(page).to have_css('li', text: property_fl.description)
      expect(page).to have_css('li', text: property_fl.property_type.name)
      expect(page).to have_css('li', text: property_fl.room_quantity)
      expect(page).to have_css('li', text: property_fl.daily_rate)
      expect(page).not_to have_css('li', text: property_bz.title)
    end

    expect(page).to have_css('h2', text: 'Propriedades de Búzios')
    within("div#region-#{region_buzios.id}") do
      expect(page).to have_css('li', text: property_bz.title)
      expect(page).to have_css('li', text: property_bz.description)
      expect(page).to have_css('li', text: property_bz.property_type.name)
      expect(page).to have_css('li', text: property_bz.room_quantity)
      expect(page).to have_css('li', text: property_bz.daily_rate)
      expect(page).not_to have_css('li', text: property_fl.title)
    end
  end

end
