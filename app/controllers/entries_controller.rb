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
      format.csv { send_data @entries.to_csv, filename: "alibaba-entries-#{Date.today}.csv" }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @locations = ['Belconnen Lakes',
'Belconnen Mall' ,
'Blacktown'   ,
'Browns  Plains'  ,
'Canberra  Centre  Upstairs',
'Canberra  Centre  Downstairs',
'Dickson'   ,
'Eastlands'   ,
'Erindale'    ,
'Fountain  Gate'  ,
'Frankston'   ,
'Fyshwick'    ,
'Goulburn'    ,
'Green Hills' ,
'Gunghalin'   ,
'Highpoint'   ,
'Kawana  Waters'  ,
'Lake  Haven' ,
'Lismore'   ,
'Liverpool'   ,
'Macquarie'   ,
'Melbourne Airport', 
'Moorebank'   ,
'Morayfield'  ,  
'Mt  Druitt'  ,
'Mt  Ommaney' ,
'Narellan' ,   
'Nudgee',    
'Penrith',   
'Phillip','Queanbeyan','Robina','Salamander  Bay','Sunshine  Plaza','Tuggerah','Tuggeranong','Warriewood','Warringah','Watergardens','Woden']
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to good_entries_path, notice: 'Entry was successfully created.' }
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
      params.require(:entry).permit(:email, :full_name, :address_line_1, :address_line_2, :postcode, :phone, :store_name, :terminal_number, :receipt_number, :sale_date, :sale_time, :birth_year, :subscribe)
    end
end
