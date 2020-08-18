class ApprovalMailer < ApplicationMailer
    default from: "royvargas55@gmail.com"
  
    def new_status(user, order)  
      @user = user
      @order = order
  
      mail(to: user.email, bcc: "royvargas55@gmail.com", subject: "Estado de la requisición #{order.project}")
    end
end