class EntriesController < ApplicationController

  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!, only: [:index, :edit, :destroy]

  def good
    @notification = "Success - thank you for your entry!"
    redirect_to new_entry_path(@notification)
  end

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
    respond_to do |format|
      format.html
      format.csv { send_data @entries.to_csv, filename: "yokohama-entries-#{Date.today}.csv" }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @tyres = ["4WD/SUV Tyres", "Passenger/Car Tyres", "Light Truck Tyres", "Other"]
    @locations = ["A1 Mobile Tyres",
"A1 Tyrepower",
"A1 Tyres & More",
"Action Tyres & More",
"Adelaide Tyrepower",
"Advance Tyres & More - Waitara",
"Advanced Tyres & More - Stafford",
"Aldinga Beach Tyres",
"Alexandra Tyrepower ",
"Alice City Tyrepower",
"Al-Ray Tyrepower",
"Andys Tyrepower Seaford",
"Ararat Tyrepower",
"Argy Tyres & Service Centre - Glendale",
"Argy Tyres & Service Centre - New Lambton",
"Argy Tyres & Service Centre - Toronto ",
"Argy Tyres & Service Centre - Toukley ",
"Argy Tyres & Service Centre - West Gosford ",
"Arno'S Tyre Service",
"Associated Cold Trd Nt Geelong",
"Associated Cold Tread Colac",
"Associated T/S Cheltenham",
"Ballina Singhs Tyre & Mech.",
"Belmont Tyrepower",
"Berwick Tyrepower",
"Bibra Lake Tyrepower",
"Border Bandag Tyre Service",
"Brighton Tyrepower",
"Brook's Steering - Parramatta",
"Brook's Tyres - Parramatta",
"Brydens Tyrepower",
"Bucik Tyrepower",
"Bulleen Tyrepower",
"Bunbury Tyrepower",
"Burdekin Tyre Service",
"Busselton Tyrepower",
"Cane Country Tyre Service",
"Cannington Tyrepower",
"Caroline Springs Tyres & More",
"Cash Tyre Service Tyrepower -  Mildura",
"Charlestown Tyres & More",
"Childs Emerald Tyre Service",
"City Rubber Tyres & More",
"Claremont Tyrepower",
"Cliff Haines Tyres & More - Merredin",
"Cluse Bros Tyrepower - Elizabeth",
"Cluse Bros Tyrepower Julian Terrace",
"Cluse Bros Tyrepower Parafield",
"Cluse Bros. Tyrepower - Munno Parra",
"Collie Tyrepower",
"Competition Tyres & More - Hallam",
"Competition Tyres & More - Murrumbeena",
"Conquest Tyrepower",
"Corowa  Federation Tyrepower",
"Corrigin Tyrepower",
"Croydon Tyrepower",
"Custom Tyrepower",
"Derby Tyrepower",
"Dongara Tyrepower",
"DP Tyres Unanderra",
"Dunkinway Tyrepower",
"Dunsborough Tyres & More",
"Edgars Tyrepower",
"Ellenbrook Tyrepower",
"Eltham Tyrepower",
"Essendon Tyrepower",
"Farrers Tyrepower",
"Figtree Tyres & More ",
"Frankston Tyrepower",
"Fred Vella Tyre Service",
"Fremantle Tyrepower",
"Garden Tyrepower",
"Geebung Tyres & More",
"Geraldton Tyrepower",
"Giles Tyres & More",
"Goodyear Swan Hill",
"Goondiwindi Tyre Service",
"Gordon Leven Tyres & More",
"Graeme Crook's Tyres & More - Booval",
"Graeme Crook's Tyres & More - Gatton",
"Graeme Crook's Tyres & More - Goodna",
"Graeme Crook's Tyres & More - Ipswich",
"Graeme Crook's Tyres & More - Logan Village",
"Graeme Crook's Tyres & More - Lowood",
"Greenwood Tyrepower",
"Hamilton Tyres & More",
"Hammond 4WD Centre Tyres & More",
"Harvey Tyrepower",
"Hawkesbury Tyres & More",
"Hendra Tyre & Mechanical P/L",
"Hillsdale Tyres & More",
"Jacobs Tyres & More Blackwood",
"Jandakot Tyrepower",
"Joondalup Tyrepower",
"Karratha Tyrepower",
"Katanning Tyrepower",
"Keith 4 Wheels",
"Keith McKay Tyres & More",
"Kensington Park Tyrepower",
"Kirwan Tyres & More",
"Knox Tyrepower",
"Lake Grace Tyrepower",
"Lakes Tyrepower",
"Launceston Tyrepower",
"Legana Tyres & More",
"Lewis Tyrepower Drysdale",
"Lewis Tyrepower Geelong",
"Lewis Tyrepower Geelong North",
"Lewis Tyrepower Torquay",
"Lindisfarne Tyrepower",
"M Group Tyre & Mechancial - Mackay ",
"M Group Tyre & Mechanical - Paget",
"M Group Tyre & Mechanical - Rockhampton",
"M Group Tyre & Mechanical - Sarina",
"Mandurah Tyrepower",
"Maryborough Tyrepower",
"Mayes Tyrepower",
"Michelin Serv Centre Gold Cst",
"Miles Mechanics Tyres & More",
"Millard Tyres & More",
"Mitchell Tyres and More",
"Morley Tyrepower",
"Murgon Tyre & Auto",
"Murphys Tyrepower",
"Murray’s Tyres & More",
"Naracorte Tyrepower",
"National Tyres Kalgoorlie",
"National Tyres Karratha",
"National Tyres Kewdale",
"National Tyres Wedgefield",
"National Tyres Whyalla ",
"Nhulunbuy Tyrepower",
"North 2 West Tyre & Wheels",
"North Albury Tyrepower",
"Northam Tyrepower",
"Northern Tyrepower",
"Numurkah Tyrepower",
"O'Neill'S Tyres Belmont",
"O'Neill'S Tyres Cessnock",
"O'Neill'S Tyres Gateshead",
"O'Neill'S Tyres Kurri Kurri",
"O'Neill'S Tyres Maitland",
"O'Neill'S Tyres Rutherford",
"O'Neill'S Tyres Wallsend",
"O'Neill'S Tyres Warners Bay",
"Pakenham Tyres & More",
"Parks & Turner Tyrepower",
"Pat's Tyres & More - Fyshwick",
"Pat's Tyres & More - Griffith",
"Pat's Tyres & More - Quenbeyan",
"Pat's Tyres & More - Wagga",
"Performance Tyres & More",
"Pirlo'S Tyre Centre",
"Port Kennedy Tyres & More",
"Premier Autocare",
"Premier Independent Tyres",
"Premium Tyre Service",
"Premium Tyres",
"Pro Tyres",
"Prospect Tyres & More",
"Reekie’s Tyres & More",
"Richard'S Tyrepower",
"Robina Tyres and More",
"Rockingham Tyrepower",
"Rutherford Tyres & More",
"Seymour Tyrepower",
"Singleton Tyre & Battery Ctr",
"Smitty’s Tyres & More",
"South Brisbane Tyres & More",
"Southside Tyrepower",
"Squizzy’s Tyres & More",
"Strathpine Tyres & More",
"Taylors Tyrepower Hamilton",
"The Tyre Place Tyres & More",
"The Tyre Professionals",
"Tim's Tyres & More",
"Tony Currie's Tyres & More",
"Tony’s Tyres & More",
"Tough Tyres Pty Ltd",
"Traction Tyres & More",
"Traralgon Tyrepower",
"Treadcare",
"Trident Tyre Centre Mount Gambier",
"Trident Tyre Centre Naracoorte",
"Trident Tyre Centre Portland",
"Tucketts Tyrepower Cranbourne",
"Tucketts Tyrepower Hastings",
"Tumbi Tyres & More",
"Tyre Torque Tyrepower Malaga",
"Tyrepower Albany",
"Tyrepower Bairnsdale",
"Tyrepower Balcatta",
"Tyrepower Ballarat",
"Tyrepower Blackwood",
"Tyrepower Booragoon",
"Tyrepower Broome",
"Tyrepower Campbelltown",
"Tyrepower Canning Vale",
"Tyrepower Carnarvon",
"Tyrepower Cheltenham",
"Tyrepower Clarkson",
"Tyrepower Colac",
"Tyrepower Creswick",
"Tyrepower Darwin",
"Tyrepower Denmark",
"Tyrepower Devonport",
"Tyrepower Diamond Creek",
"Tyrepower Esperence",
"Tyrepower Exmouth",
"Tyrepower Goodway",
"Tyrepower Hawthorn",
"Tyrepower Holden Hill",
"Tyrepower Horsham",
"Tyrepower Kalgoorlie",
"Tyrepower Kelmscott",
"Tyrepower Manjimup",
"Tyrepower Margaret River",
"Tyrepower Melton",
"Tyrepower Moorabbin",
"Tyrepower Mornington",
"Tyrepower Mt Lawley",
"Tyrepower Newman",
"Tyrepower O'Connor",
"Tyrepower Pakenham",
"Tyrepower Perth City",
"Tyrepower Pinjarra",
"Tyrepower Port Kennedy",
"Tyrepower Port Melbourne",
"Tyrepower Port Pirie",
"Tyrepower Reservoir",
"Tyrepower Ridgehaven",
"Tyrepower Riverland",
"Tyrepower Rosebud",
"Tyrepower Sale",
"Tyrepower Sunbury",
"Tyrepower Surrey Hills",
"Tyrepower Wangara",
"Tyrepower Werribee",
"Tyrepower Whittlesea",
"Tyrepower Wodonga",
"Tyrepower Wonthaggi",
"Tyrepower Woodside",
"Tyrepower Woori Yallock",
"Tyreright - Alexandria",
"Tyreright - Alice Springs",
"Tyreright - Altona North",
"Tyreright - Armadale",
"Tyreright - Belmont",
"Tyreright - Bentleigh East",
"Tyreright - Boulder ",
"Tyreright - Brighton",
"Tyreright - Brookvale",
"Tyreright - Bundaberg",
"Tyreright - Burnie",
"Tyreright - Coffs Harbour",
"Tyreright - Coonamble",
"Tyreright - Dalby",
"Tyreright - Dubbo",
"Tyreright - Exmouth",
"Tyreright - Forbes",
"Tyreright - Garbutt",
"Tyreright - Gilgandra",
"Tyreright - Goulburn",
"Tyreright - Gympie",
"Tyreright - Hastings",
"Tyreright - Hervey Bay",
"Tyreright - Hobart",
"Tyreright - Horsham",
"Tyreright - Ingleburn",
"Tyreright - Latrobe",
"Tyreright - Lytton",
"Tyreright - Mandurah",
"Tyreright - Maryborough",
"Tyreright - Melville",
"Tyreright - Merredin",
"Tyreright - Morley",
"Tyreright - Narrabri",
"Tyreright - Narromine",
"Tyreright - Oakey",
"Tyreright - Osborne Park",
"Tyreright - Parramatta",
"Tyreright - Picton",
"Tyreright - Port Hedland",
"Tyreright - Port Macquarie",
"Tyreright - Prestons",
"Tyreright - Ravenshoe",
"Tyreright - Rockingham",
"Tyreright - Rocklea",
"Tyreright - Salisbury",
"Tyreright - St Leonards",
"Tyreright - Stafford",
"Tyreright - Tamworth",
"Tyreright - Taroom",
"Tyreright - Tomago",
"Tyreright - Truck City",
"Tyreright - Tuggerah",
"Tyreright - Tweed Heads",
"Tyreright - Ulverstone",
"Tyreright - Varsity Lakes",
"Tyreright - Wandoan",
"Tyreright - Wangara",
"Tyreright - Warren",
"Tyreright - Wellington",
"Tyreright - Welshpool",
"Tyreright - West Melbourne",
"Tyreright - Wetherill Park",
"Tyreright - Windsor",
"Tyreright - Woodville South",
"Tyreright - Yatala",
"Tyres & More Croydon",
"Tyres & More Geraldton",
"Tyres & More Mornington",
"Tyres Your Way",
"Tyrexpress Tyrepower",
"Vance Hills Affordable Tyres",
"Victor Tyrepower",
"Warracknabeal Tyrepower",
"Welshpool Tyre Service Tyres & More",
"Wetherill Park Tyres and More",
"Wheels World Tyres & More",
"Willetton Tyrepower",
"Wise Choice Tyres & More",
"World Of Tyres"]
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    CongratsMailer.congrats(@entry).deliver_now
    respond_to do |format|
      if @entry.save

        format.html { redirect_to thankyou_index_path, notice: 'Entry was successfully submitted.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:email, :full_name, :first_name, :last_name, :address_line_1, :address_line_2, :postcode, :phone, :store_name, :terminal_number, :receipt_number, :sale_date, :sale_time, :birth_year, :product, :receipt, :subscribe)
    end
end
