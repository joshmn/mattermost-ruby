module Mattermost
  class Admin < MattermostObject

    def self.get_logs
      Mattermost.get("/admin/logs")
    end

    def self.get_all_audits
      Mattermost.get("/admin/audits")
    end

    def self.get_config
      Mattermost.get("/admin/config")
    end

    def self.save_config
      Mattermost.post("/admin/save_config")
    end

    def self.test_email
      Mattermost.post("/admin/test_email")
    end

    def self.get_client_config
      Mattermost.get("/admin/client_props")
    end

    def self.log_client
      Mattermost.post("/admin/log_client")
    end

    def self.get_analytics(name, id = nil)
      uri = "/admin/analytics"
      uri += "/#{id}" if id
      uri += "/#{name}"
      Mattermost.get(uri)
    end

    def self.save_compliance_report
      Mattermost.post("/admin/save_compliance_report")
    end

    def self.get_compliance_reports
      Mattermost.get("/admin/compliance_reports")
    end

    def self.download_compliance_report(id)
      Mattermost.get("/admin/download_compliance_report/#{id}")
    end

    def self.upload_brand_image
      Mattermost.post("/admin/upload_brand_image")
    end

    def self.get_brand_image
      Mattermost.get("/admin/get_brand_image")
    end

    def self.admin_reset_mfa
      Mattermost.post("/admin/reset_mfa")
    end

    def self.admin_reset_password
      Mattermost.post("/admin/reset_password")
    end

  end
end