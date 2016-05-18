module Mattermost
  class Admin < MattermostObject

    # Mattermost puts this under users, but I feel it doesn't belong there
    # since it says more about the logged in user and the system than
    # a user collection itself.
    def self.initial_load
      Mattermost.get("/users/initial_load")
    end

    def self.logs
      Mattermost.get("/admin/logs")
    end

    def self.audits
      Mattermost.get("/admin/audits")
    end

    def self.config
      Mattermost.get("/admin/config")
    end

    def self.save_config
      raise NotImplementedError
      Mattermost.post("/admin/save_config")
    end

    def self.test_email
      raise NotImplementedError
      Mattermost.post("/admin/test_email")
    end

    def self.client_config
      Mattermost.get("/admin/client_props")
    end

    def self.log_client
      raise NotImplementedError
      Mattermost.post("/admin/log_client")
    end

    def self.analytics(name, id = nil)
      raise NotImplementedError
      uri = "/admin/analytics"
      uri += "/#{id}" if id
      uri += "/#{name}"
      Mattermost.get(uri)
    end

    def self.save_compliance_report
      raise NotImplementedError
      Mattermost.post("/admin/save_compliance_report")
    end

    def self.compliance_reports
      raise NotImplementedError
      Mattermost.get("/admin/compliance_reports")
    end

    def self.download_compliance_report(id)
      raise NotImplementedError
      Mattermost.get("/admin/download_compliance_report/#{id}")
    end

    def self.upload_brand_image
      raise NotImplementedError
      Mattermost.post("/admin/upload_brand_image")
    end

    def self.get_brand_image
      raise NotImplementedError
      Mattermost.get("/admin/get_brand_image")
    end

    def self.admin_reset_mfa
      raise NotImplementedError
      Mattermost.post("/admin/reset_mfa")
    end

    def self.admin_reset_password
      raise NotImplementedError
      Mattermost.post("/admin/reset_password")
    end

  end
end