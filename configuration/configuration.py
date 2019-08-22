import os

import frappe


def configure_app():
    disable_registration()
    configure_email()
    configure_LDAP()



def configure_email():
    email_account = frappe.get_doc("Email Domain", "example.com")
    email_account.email_server = os.getenv('EMAIL_SERVER')
    email_account.email_id = os.getenv('EMAIL_ADDRESS')
    email_account.domain_name = os.getenv('DOMAIN_NAME')
    email_account.smtp_server = os.getenv('SMTP_SERVER')
    email_account.smtp_port = int(os.getenv('PORT'))
    email_account.use_imap = int(os.getenv('USE_IMAP'))
    email_account.use_ssl = int(os.getenv('USE_SSL'))
    email_account.tls = int(os.getenv('USE_TLS'))
    email_account.attachment_limit = int(os.getenv('ATTACHMENT_LIMIT_MB'))
    email_account.save()



def configure_LDAP():
    doc = frappe.get_doc("LDAP_SETTINGS")
    doc.ldap_email_field = os.getenv('LDAP_EMAIL')
    doc.base_dn = os.getenv('BASE_DISTINGUISHED_NAME')
    doc.ldap_first_name_field = os.getenv('LDAP_FIRST_NAME')
    doc.ldap_search_string = os.getenv('LDAP_SEARCH_STRING')
    doc.ldap_server_url = os.getenv('LDAP_SERVER_URL')
    doc.default_role = os.getenv('DEFAULT_ROLE_ON_CREATION')
    doc.ldap_username_field = os.getenv('LDAP_USERNAME')
    doc.organizational_unit = os.getenv('Organizational_UNIT_FOR_USERS')
    doc.password = os.getenv('Password_FOR_BASE_DN')
    doc.save()


def disable_registration():
    doc = frappe.get_doc("Website Settings")
    doc.disable_signup = 0
    doc.save()
