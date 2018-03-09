class UserMailer < ApplicationMailer

  def base_fields(record, extra={})
    {
      name: record.name || record.first_name || record.email,
      first_name: record.first_name || record.email,
      full_name: record.full_name || record.email,
      invite_sender_organization_name: 'Uskillity UG',
      support_email: 'welcome@uskillity.de',
      Uskillity_support_email: 'welcome@uskillity.de',
    }.merge(extra)
  end

  def you_are_participating(ws, session, record, participations)
    PostmarkTemplateMailDelivery.deliver(from: 'welcome@uskillity.de',
                                         to: record.email,
                                         template_id: 5059603,
                                         template_model: base_fields(record, {
                                           ticket_number: participations.map{ |p| p.id.to_s }.map(&:inspect).join(', '),
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
                                           workshop_title: ws.title
                                         }))
  end
end


