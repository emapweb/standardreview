class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name         :string, :required
    date         :date, :required
    phone        :string, :required
    organization :string, :required
    email        :email_address, :required
    address      :string, :required
    city         :string, :required
    zip          :string, :required
    #com_rec      enum_string(:"new text", :"revised text", :"deleted text") 
    comment      :html, :required
    support      :html, :required
    signature    :string, :required
    rop_email    :email_address, :required
    timestamps
  end

  belongs_to :state
  belongs_to :com_rec
  belongs_to :standard
  belongs_to :area

  #validates_presence_of :state, :com_rec, :standard, :area
  validates_presence_of :state, :on => :submit
  validates_presence_of :com_rec, :on => :submit
  validates_presence_of :standard, :on => :submit
  validates_presence_of :area, :on => :submit

  after_create do |project|
    ProjectMailer.standard_comment(id, name, date, phone, organization, email, address, city, state, zip, standard, area, com_rec, comment, support, rop_email).deliver
  end

  # --- Permissions --- #

  def create_permitted?
    true
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
