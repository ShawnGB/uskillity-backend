class UserMailer < ApplicationMailer

  def base_fields(record, extra={})
    {
      name: record.first_name || record.name || record.email,
      first_name: record.first_name || record.email,
      full_name: record.full_name || record.email,
      invite_sender_organization_name: 'Uskillity UG',
      support_email: 'welcome@uskillity.de',
      Uskillity_support_email: 'welcome@uskillity.de',
    }.merge(extra)
  end

  def giropay_payment_request(user, order, redirect_url)
    PostmarkTemplateMailDelivery.deliver(
      from: 'welcome@uskillity.de',
      to: user.email,
      template_id: 6803162,
      template_model: {
        name: order.buyer.first_name || order.buyer.name || order.buyer.email, #name of person who ordered
        payment_link: redirect_url,
        workshop_title: order.workshop_name #title of workshop
      }
    )
  end

  def you_are_participating(ws, session, record, participations)
    PostmarkTemplateMailDelivery.deliver(from: 'welcome@uskillity.de',
                                         to: record.email,
                                         template_id: 5059603,
                                         template_model: base_fields(record, {
                                           ticket_number: participations.map{ |p| "#{Time.now.year.to_s}/#{p.id.to_s}" }.map(&:inspect).join(', '),
                                           workshop_title: ws.title,
                                           date_of_purchuse: Time.now.to_date,
                                           workshop_date: session.starts_at.to_date,
                                           workshop_time: session.starts_at.strftime('%H:%M'),
                                           workshop_location: ws.full_address || "",
                                           ticket_count: participations.count,
                                           total_amount: (ws.fees || 0) * participations.count,
                                         }))
  end

  def participations_created(ws, participant, count)
    PostmarkTemplateMailDelivery.deliver(from: 'welcome@uskillity.de',
                                         to: ws.provider.email,
                                         template_id: 5124325,
                                         template_model: base_fields(participant, {
                                           ticket_count: count,
                                           workshop_title: ws.title,
                                           participant_name:  participant.first_name || participant.name || participant.email,
                                         }))
  end

  def workshop_awaiting_approval(ws)
    PostmarkTemplateMailDelivery.deliver(from: 'welcome@uskillity.de',
                                         to: ws.provider.email,
                                         template_id: 6054802,
                                         template_model: base_fields(ws.provider, {
                                           workshop_title: ws.title,
                                           workshop_link: (ENV['CLIENTHOSTDOMAIN'] || "https://www.uskillity.de/#") + "/workshops/#{ws.id}"
                                         }))
  end



end
