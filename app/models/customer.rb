class Customer < ApplicationRecord
   validates :name, presence: true
  # before_validation :titleize_name
  # after_validation :log_errors

  # private
  #   def titleize_name
  #     self.name = name.downcase.titleize if name.present?
  #     Rails.logger.info("Name titleized to #{name}")
  #   end

  #   def log_errors
  #     if errors.any?
  #       Rails.logger.error("Validation failed: #{errors.full_messages.join(', ')}")
  #     end
  #   end


  before_update :check_role_change
  around_update :log_updating
  after_update :send_update_email

  private
    def check_role_change
      if name_changed?
        Rails.logger.info("User role changed to #{name}")
      end
    end

    def log_updating
      Rails.logger.info("Updating user with email: #{email}")
      yield
      Rails.logger.info("User updated with email: #{email}")
    end

    def send_update_email
      UserMailer.update_email(self).deliver_later
      Rails.logger.info("Update email sent to: #{email}")
    end
end
