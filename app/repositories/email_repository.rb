class EmailRepository < BaseRepository
  include ActionView::Helpers::NumberHelper

  def forgot_password
    receiver = {
      Email: record.try(:email),
      Name: record.try(:full_name).to_s
    }

    Mailjet::Send.create(
      messages: [
        base_template(
          ENV['RESET_PASSWORD_TEMPLATE_ID'].to_i,
          receiver,
          'Cập nhật lại mật khẩu'
        ).merge({
          Variables: {
            first_name: record.try(:first_name).to_s,
            reset_password_url: record.try(:reset_password_url).to_s,
          }
        }.as_json)
      ]
    )
  end
  
  private

  def base_template(template_id, receiver, subject)
    {
      From: from,
      To: [receiver],
      TemplateID: template_id,
      TemplateLanguage: true,
      Subject: subject
    }
  end

  def from
    {
      Email: ENV['NOREPLY_EMAIL'],
      Name: 'Đấu Giá Công Trình'
    }
  end
end
