class ProjectMailer < ActionMailer::Base
  default :from => "emap@csg.org"
  
  def standard_comment(id, name, date, phone, organization, email, address, city, state, zip, standard, area, com_rec, comment, support, rop_email)
    @id, @name, @date, @phone, @organization, @email, @address, @city, @state, @zip, @standard, @area, @com_rec, @comment, @support, @rop_email = id, name, date, phone, organization, email, address, city, state, zip, standard, area, com_rec, comment, support, rop_email
    mail( :subject => "Comment for the Emergency Management Standard by EMAP - 2013",
          :to      => rop_email,
          :bcc      => "sgauvin@csg.org, emap@csg.org, nishmael@csg.org" )
  end

end
