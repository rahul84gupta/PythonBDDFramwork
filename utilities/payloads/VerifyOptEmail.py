def verifyOpt(email, message_type, opt_status, program_id, source_id, trigger_type, address_1, address_2, city, country,
              first_name, last_name, phone, mobile, postal_cd, state):
    body = {
            "email": email,
            "message_type": message_type,
            "opt_status": opt_status,
            "program_id": program_id,
            "source_id": source_id,
            "trigger_type": trigger_type,
            "profileData": {
                "address_1": address_1,
                "address_2": address_2,
                "city": city,
                "country": country,
                "first_name": first_name,
                "last_name": last_name,
                "phone": phone,
                "mobile": mobile,
                "postal_cd": postal_cd,
                "state": state
            }
    }

    return body
