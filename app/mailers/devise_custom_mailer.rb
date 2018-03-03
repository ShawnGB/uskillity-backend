class DeviseCustomMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def postmark_fields_for_record(record, extra={})
    {
      name: record.name || record.first_name || record.email,
      first_name: record.first_name || record.email,
      full_name: record.full_name || record.email,
      invite_sender_organization_name: 'Uskillity UG',
      support_email: 'welcome@uskillity.de',
      Uskillity_support_email: 'welcome@uskillity.de',
    }.merge(extra)
  end

  def confirmation_instructions(record, token, opts={})
    confirm_params = {
      config: "default",
      redirect_url: confirmed_url(),
      confirmation_token: token
    }
    action_url = "#{confirmation_url()}?#{confirm_params.to_query()}"
      PostmarkTemplateMailDelivery.deliver(from: 'welcome@uskillity.de',
                                           to: record.email,
                                           template_id: 5018001,
                                           template_model: postmark_fields_for_record(record, {action_url: action_url} ))
  end

  def reset_password_instructions(record, token, opts={})
    reset_params = {
      config: "default",
      redirect_url: password_reset_url(),
      reset_password_token: token
    }
    action_url = "#{edit_password_url()}?#{reset_params.to_query()}"
      PostmarkTemplateMailDelivery.deliver(from: 'welcome@uskillity.de',
                                           to: record.email,
                                           template_id: 1057902,
                                           template_model: postmark_fields_for_record(record, {passwort_reset_url: action_url }))
  end

  def unlock_instructions(record, token, opts={})
    # TODO use template mailer if necessary here
    super
  end

  private

  def url_for(endpoint)
    "#{ENV['SERVERHOSTDOMAIN']}/#{endpoint}"
  end

  def edit_password_url()
    url_for('auth/password/edit')
  end

  def password_reset_url()
    url_for('password_reset')
  end

  def confirmation_url()
    url_for('auth/confirmation')
  end

  def confirmed_url()
    ENV['CLIENTHOSTDOMAIN'] || 'https://d3afqfzdd8lb1l.cloudfront.net'
  end
end
