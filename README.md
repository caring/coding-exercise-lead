# Caring.com Coding Exercise

This repository contains a Rails application that implements parts of a very simple sales lead delivery system. We define an API where a new lead's email address is stored in our system. We also [define a mailer](./app/mailers/lead_mailer.rb) which will be used to send these email addresses to [an existing set of lead recipients](./db/seeds.rb), however the act of sending these leads has yet to be implemented.

Key files:
- app/models/lead.rb
- app/models/lead_recipient.rb
- app/controllers/api/leads_controller.rb
- app/mailers/lead_mailer.rb
- app/views/lead_mailer/new_lead.html.erb

## Specification

When [a new lead is created through the API](./app/controllers/api/leads_controller.rb) it should trigger the [LeadMailer#new_lead](./app/mailers/lead_mailer.rb) email to be sent to every `LeadRecipient` in our system
  - This email should contain the lead's email address in the subject and the body
  - If this email fails to send to any given recipient, it should still be sent to the rest of the recipients
  - If this email fails to send to any given recipient due to an SMTP error, and an admin changes that recipient's email address, the send should be retried
  - The client creating the lead should receive acknowledgement that the lead has been stored in our system, regardless of the success of delivering the lead to all recipients
  - New recipients should not receive leads created before they were created

You may assume that two leads with the same email address never occur.

I should be able to visit the root path `/` and see a list of all the leads in the system
  - This list should enumerate which recipients have received an email, and which have not
  - If a recipient has not received an email due to an SMTP error, that error should be visible
  - If a recipient has not received an email because their account was created after the lead was created, they should not be included in the list
  - The list should be ordered such that the most recently created leads are first
  - The list should be paginated to 50 per page

Please treat this, within reason, like it was a production grade project. Feel free to use any libraries you would use for such a project.

If you have any questions don't hesitate to ask!

### Technical questions

Please answer the following questions in a markdown file called `Answers to technical questions.md`.

1. How long did you spend on the exercise? What would you add to your solution if you had more time? If you didn't spend much time on the exercise then use this as an opportunity to explain what you would add.
2. What was the most useful feature that you used that was added to a recent version of Ruby? Please link to a place where you used it.
3. How would you track down a performance issue in production? Have you ever had to do this?
