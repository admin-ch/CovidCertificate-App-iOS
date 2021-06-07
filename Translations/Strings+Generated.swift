// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
enum UBLocalized {
    enum UBLocalizedKey: String {
        /// Zertifikat hinzufügen
        case accessibility_add_button_key = "accessibility_add_button"
        /// Schliessen
        case accessibility_close_button_key = "accessibility_close_button"
        /// Häufige Fragen
        case accessibility_faq_button_key = "accessibility_faq_button"
        /// Information
        case accessibility_info_box_key = "accessibility_info_box"
        /// Impressum
        case accessibility_info_button_key = "accessibility_info_button"
        /// Taschenlampe ausschalten
        case accessibility_lamp_off_button_key = "accessibility_lamp_off_button"
        /// Taschenlampe einschalten
        case accessibility_lamp_on_button_key = "accessibility_lamp_on_button"
        /// Zertifikate Liste
        case accessibility_list_button_key = "accessibility_list_button"
        /// Zugriff auf Kamera erlauben
        case camera_permission_dialog_action_key = "camera_permission_dialog_action"
        /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
        case camera_permission_dialog_text_key = "camera_permission_dialog_text"
        /// Abbrechen
        case cancel_button_key = "cancel_button"
        /// Genesen
        case certificate_reason_recovered_key = "certificate_reason_recovered"
        /// Test
        case certificate_reason_tested_key = "certificate_reason_tested"
        /// Impfung
        case certificate_reason_vaccinated_key = "certificate_reason_vaccinated"
        /// Schliessen
        case close_button_key = "close_button"
        /// Weiter
        case continue_button_key = "continue_button"
        /// Genesung
        case covid_certificate_recovery_title_key = "covid_certificate_recovery_title"
        /// Test
        case covid_certificate_test_title_key = "covid_certificate_test_title"
        /// Covid-Zertifikat
        case covid_certificate_title_key = "covid_certificate_title"
        /// Impfung
        case covid_certificate_vaccination_title_key = "covid_certificate_vaccination_title"
        /// Löschen
        case delete_button_key = "delete_button"
        /// Einstellungen ändern
        case error_action_change_settings_key = "error_action_change_settings"
        /// Erneut versuchen
        case error_action_retry_key = "error_action_retry"
        /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
        case error_camera_permission_text_key = "error_camera_permission_text"
        /// Kein Zugriff auf Kamera
        case error_camera_permission_title_key = "error_camera_permission_title"
        /// Überprüfen Sie Ihre Internet Verbindung.
        case error_network_text_key = "error_network_text"
        /// Netzwerkfehler
        case error_network_title_key = "error_network_title"
        /// Fehler
        case error_title_key = "error_title"
        /// Aktualisieren
        case force_update_button_key = "force_update_button"
        /// Laden Sie die neue Version der App.
        case force_update_text_key = "force_update_text"
        /// Update benötigt
        case force_update_title_key = "force_update_title"
        /// Impressum
        case impressum_title_key = "impressum_title"
        /// Einstellungen
        case ios_settings_open_key = "ios_settings_open"
        /// de
        case language_key_key = "language_key"
        /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
        case NSCameraUsageDescription_key = "NSCameraUsageDescription"
        /// OK
        case ok_button_key = "ok_button"
        /// Kein gültiger Code
        case qr_scanner_error_key = "qr_scanner_error"
        /// Covid-19
        case target_disease_name_key = "target_disease_name"
        /// Ein unbekannter Fehler ist aufgetreten.
        case unknown_error_key = "unknown_error"
        /// Covid Check
        case verifier_app_name_key = "verifier_app_name"
        /// COVID Certificate Check
        case verifier_app_title_key = "verifier_app_title"
        /// http://itunes.apple.com/app/id1565917510
        case verifier_apple_app_store_url_key = "verifier_apple_app_store_url"
        /// Geburtsdatum
        case verifier_covid_certificate_birthdate_key = "verifier_covid_certificate_birthdate"
        /// Nachname
        case verifier_covid_certificate_name_key = "verifier_covid_certificate_name"
        /// Vorname
        case verifier_covid_certificate_prename_key = "verifier_covid_certificate_prename"
        /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App.
        case verifier_faq_works_answer_1_key = "verifier_faq_works_answer_1"
        /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
        case verifier_faq_works_answer_2_key = "verifier_faq_works_answer_2"
        /// Als gültige Ausweisdokumente werden Pass oder ID akzeptiert. Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
        case verifier_faq_works_answer_3_key = "verifier_faq_works_answer_3"
        /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
        case verifier_faq_works_answer_4_key = "verifier_faq_works_answer_4"
        /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
        case verifier_faq_works_answer_5_key = "verifier_faq_works_answer_5"
        /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
        case verifier_faq_works_answer_6_key = "verifier_faq_works_answer_6"
        /// Wie können Covid-Zertifikate geprüft werden?
        case verifier_faq_works_question_1_key = "verifier_faq_works_question_1"
        /// Was wird genau geprüft?
        case verifier_faq_works_question_2_key = "verifier_faq_works_question_2"
        /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
        case verifier_faq_works_question_3_key = "verifier_faq_works_question_3"
        /// Können auch ausländische Zertifikate geprüft werden?
        case verifier_faq_works_question_4_key = "verifier_faq_works_question_4"
        /// Welche Daten sehe ich beim Prüfvorgang?
        case verifier_faq_works_question_5_key = "verifier_faq_works_question_5"
        /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
        case verifier_faq_works_question_6_key = "verifier_faq_works_question_6"
        /// Mit der COVID Certificate Check App können QR-Codes auf Covid-Zertifikaten gescannt und die Zertifikate auf Echtheit und Gültigkeit überprüft werden.
        case verifier_faq_works_subtitle_key = "verifier_faq_works_subtitle"
        /// So werden Covid-Zertifikate geprüft
        case verifier_faq_works_title_key = "verifier_faq_works_title"
        /// Covid Certificate
        case verifier_homescreen_header_title_key = "verifier_homescreen_header_title"
        /// Vorgewiesenes Zertifikat scannen
        case verifier_homescreen_pager_description_1_key = "verifier_homescreen_pager_description_1"
        /// Zertifikate werden automatisch geprüft
        case verifier_homescreen_pager_description_2_key = "verifier_homescreen_pager_description_2"
        /// Prüfen
        case verifier_homescreen_scan_button_key = "verifier_homescreen_scan_button"
        /// So funktioniert's
        case verifier_homescreen_support_button_key = "verifier_homescreen_support_button"
        /// Check
        case verifier_homescreen_title_key = "verifier_homescreen_title"
        /// QR-Code scannen\nzum Prüfen
        case verifier_qr_scanner_scan_qr_text_key = "verifier_qr_scanner_scan_qr_text"
        /// Das Gerät befindet sich im Flugmodus.
        case verifier_retry_flightmode_error_key = "verifier_retry_flightmode_error"
        /// Ein Netzwerkfehler ist aufgetreten.
        case verifier_retry_network_error_key = "verifier_retry_network_error"
        /// So funktioniert's
        case verifier_support_header_key = "verifier_support_header"
        /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-check-app.html
        case verifier_terms_privacy_link_key = "verifier_terms_privacy_link"
        /// Prüfen
        case verifier_title_qr_scan_key = "verifier_title_qr_scan"
        /// Entspricht nicht den Gültigkeitskriterien der Schweiz: Die Gültigkeit des Zertifikat ist abgelaufen.
        case verifier_verifiy_error_expired_key = "verifier_verifiy_error_expired"
        /// Entspricht nicht den Gültigkeitskriterien der Schweiz: Das Zertifikat ist noch nicht gültig.
        case verifier_verifiy_error_notyetvalid_key = "verifier_verifiy_error_notyetvalid"
        /// Das Zertifikat wurde widerrufen
        case verifier_verify_error_info_for_blacklist_key = "verifier_verify_error_info_for_blacklist"
        /// Das Zertifikat hat keine gültige Signatur
        case verifier_verify_error_info_for_certificate_invalid_key = "verifier_verify_error_info_for_certificate_invalid"
        /// Entspricht nicht den Gültigkeitskriterien der Schweiz
        case verifier_verify_error_info_for_national_rules_key = "verifier_verify_error_info_for_national_rules"
        /// Ein unerwarteter Fehler ist aufgetreten.
        case verifier_verify_error_list_info_text_key = "verifier_verify_error_list_info_text"
        /// Prüfung fehlgeschlagen
        case verifier_verify_error_list_title_key = "verifier_verify_error_list_title"
        /// Covid-Zertifikat ungültig
        case verifier_verify_error_title_key = "verifier_verify_error_title"
        /// Zertifikat wird geprüft
        case verifier_verify_loading_text_key = "verifier_verify_loading_text"
        /// Nur mit einem \nAusweisdokument gültig
        case verifier_verify_success_info_key = "verifier_verify_success_info"
        /// Prüfung erfolgreich
        case verifier_verify_success_title_key = "verifier_verify_success_title"
        /// Hinzufügen
        case wallet_add_certificate_key = "wallet_add_certificate"
        /// Hinzufügen
        case wallet_add_certificate_button_key = "wallet_add_certificate_button"
        /// Covid Cert
        case wallet_app_name_key = "wallet_app_name"
        /// http://itunes.apple.com/app/id1565917320
        case wallet_apple_app_store_url_key = "wallet_apple_app_store_url"
        /// Covid-Zertifikat
        case wallet_certificate_key = "wallet_certificate"
        /// Dieses Zertifikat ist bereits in der App gespeichert
        case wallet_certificate_already_exists_key = "wallet_certificate_already_exists"
        /// Zertifikat erstellt am\n{DATE}
        case wallet_certificate_date_key = "wallet_certificate_date"
        /// Wollen Sie das Zertifikat wirklich löschen?
        case wallet_certificate_delete_confirm_text_key = "wallet_certificate_delete_confirm_text"
        /// Diese Bescheinigung ist kein Reisedokument. \n\nDie wissenschaftlichen Erkenntnisse über COVID-19-Impfung, -Genesung und -Tests entwickeln sich weiter, auch im Hinblick auf neue bedenkliche Varianten des Virus. \n\nBitte informieren Sie sich vor der Reise über die geltenden Gesundheitsmassnahmen und die damit verbundenen Einschränkungen am Zielort.
        case wallet_certificate_detail_note_key = "wallet_certificate_detail_note"
        /// UVCI
        case wallet_certificate_identifier_key = "wallet_certificate_identifier"
        /// Impfdosis
        case wallet_certificate_impfdosis_title_key = "wallet_certificate_impfdosis_title"
        /// Hersteller
        case wallet_certificate_impfstoff_holder_key = "wallet_certificate_impfstoff_holder"
        /// Produkt
        case wallet_certificate_impfstoff_product_name_title_key = "wallet_certificate_impfstoff_product_name_title"
        /// Impfstoff
        case wallet_certificate_impfstoff_title_key = "wallet_certificate_impfstoff_title"
        /// Zertifikate
        case wallet_certificate_list_title_key = "wallet_certificate_list_title"
        /// Datum des ersten positiven Resultats
        case wallet_certificate_recovery_first_positiv_result_key = "wallet_certificate_recovery_first_positiv_result"
        /// Gültig ab
        case wallet_certificate_recovery_from_key = "wallet_certificate_recovery_from"
        /// Gültig bis
        case wallet_certificate_recovery_until_key = "wallet_certificate_recovery_until"
        /// Krankheit oder Erreger
        case wallet_certificate_target_disease_title_key = "wallet_certificate_target_disease_title"
        /// Testcenter
        case wallet_certificate_test_done_by_key = "wallet_certificate_test_done_by"
        /// Hersteller
        case wallet_certificate_test_holder_key = "wallet_certificate_test_holder"
        /// Land des Tests
        case wallet_certificate_test_land_key = "wallet_certificate_test_land"
        /// Name
        case wallet_certificate_test_name_key = "wallet_certificate_test_name"
        /// Datum Resultat
        case wallet_certificate_test_result_date_title_key = "wallet_certificate_test_result_date_title"
        /// NEGATIV
        case wallet_certificate_test_result_negativ_key = "wallet_certificate_test_result_negativ"
        /// POSITIV
        case wallet_certificate_test_result_positiv_key = "wallet_certificate_test_result_positiv"
        /// Ergebnis
        case wallet_certificate_test_result_title_key = "wallet_certificate_test_result_title"
        /// Datum der Probenentnahme
        case wallet_certificate_test_sample_date_title_key = "wallet_certificate_test_sample_date_title"
        /// Typ
        case wallet_certificate_test_type_key = "wallet_certificate_test_type"
        /// Land der Impfung
        case wallet_certificate_vaccination_country_title_key = "wallet_certificate_vaccination_country_title"
        /// Impfdatum
        case wallet_certificate_vaccination_date_title_key = "wallet_certificate_vaccination_date_title"
        /// Herausgeber
        case wallet_certificate_vaccination_issuer_title_key = "wallet_certificate_vaccination_issuer_title"
        /// Art des Impfstoffs
        case wallet_certificate_vaccine_prophylaxis_key = "wallet_certificate_vaccine_prophylaxis"
        /// In der Schweiz gültig ab:\n{DATE}
        case wallet_certificate_valid_from_key = "wallet_certificate_valid_from"
        /// bis
        case wallet_certificate_valid_until_key = "wallet_certificate_valid_until"
        /// Gültigkeit in der\nSchweiz
        case wallet_certificate_validity_key = "wallet_certificate_validity"
        /// Prüfung erfolgreich
        case wallet_certificate_verify_success_key = "wallet_certificate_verify_success"
        /// Das Zertifikat wird geprüft
        case wallet_certificate_verifying_key = "wallet_certificate_verifying"
        /// Gültigkeit des Zertifikats\nabgelaufen
        case wallet_error_expired_key = "wallet_error_expired"
        /// abgelaufen
        case wallet_error_expired_bold_key = "wallet_error_expired_bold"
        /// Zertifikat mit\nungültiger Signatur
        case wallet_error_invalid_signature_key = "wallet_error_invalid_signature"
        /// ungültiger Signatur
        case wallet_error_invalid_signature_bold_key = "wallet_error_invalid_signature_bold"
        /// Entspricht nicht den Gültigkeitskriterien der Schweiz
        case wallet_error_national_rules_key = "wallet_error_national_rules"
        /// Zertifikat wurde\nwiderrufen
        case wallet_error_revocation_key = "wallet_error_revocation"
        /// widerrufen
        case wallet_error_revocation_bold_key = "wallet_error_revocation_bold"
        /// In der Schweiz gültig ab:\n{DATE}
        case wallet_error_valid_from_key = "wallet_error_valid_from"
        /// Häufige Fragen
        case wallet_faq_header_key = "wallet_faq_header"
        /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
        case wallet_faq_questions_answer_1_key = "wallet_faq_questions_answer_1"
        /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass sie in jedem Fall auch noch ein Ausweisdokument (Pass oder ID) vorweisen müssen.
        case wallet_faq_questions_answer_2_key = "wallet_faq_questions_answer_2"
        /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
        case wallet_faq_questions_answer_3_key = "wallet_faq_questions_answer_3"
        /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument (Pass oder ID) gültig.
        case wallet_faq_questions_answer_4_key = "wallet_faq_questions_answer_4"
        /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier deshalb sorgfältig auf. Bei Verlust müssen Sie das Covid-Zertifikat erneut bei der ausgebenden Stelle anfragen.
        case wallet_faq_questions_answer_5_key = "wallet_faq_questions_answer_5"
        /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
        case wallet_faq_questions_question_1_key = "wallet_faq_questions_question_1"
        /// Wie kann ich ein Covid-Zertifikat vorweisen?
        case wallet_faq_questions_question_2_key = "wallet_faq_questions_question_2"
        /// Wo sind meine Daten gespeichert?
        case wallet_faq_questions_question_3_key = "wallet_faq_questions_question_3"
        /// Wie werden Missbrauch und Fälschung verhindert?
        case wallet_faq_questions_question_4_key = "wallet_faq_questions_question_4"
        /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
        case wallet_faq_questions_question_5_key = "wallet_faq_questions_question_5"
        /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
        case wallet_faq_questions_subtitle_key = "wallet_faq_questions_subtitle"
        /// Was sind Covid-Zertifikate?
        case wallet_faq_questions_title_key = "wallet_faq_questions_title"
        /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
        case wallet_faq_works_answer_1_key = "wallet_faq_works_answer_1"
        /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument (Pass oder ID) des Zertifikatsinhabers gültig.
        case wallet_faq_works_answer_2_key = "wallet_faq_works_answer_2"
        /// In der COVID Certificate App wird ausgewiesen, wann Ihr Covid-Zertifikat in der Schweiz ablaufen wird. Sie können in der Detail-Ansicht zudem per Knopfdruck überprüfen, ob Ihr Covid-Zertifikat aktuell gültig ist.
        case wallet_faq_works_answer_3_key = "wallet_faq_works_answer_3"
        /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
        case wallet_faq_works_answer_4_key = "wallet_faq_works_answer_4"
        /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
        case wallet_faq_works_answer_5_key = "wallet_faq_works_answer_5"
        /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihr Mobilgerät bringen. Scannen Sie dazu erneut den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
        case wallet_faq_works_answer_6_key = "wallet_faq_works_answer_6"
        /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
        case wallet_faq_works_question_1_key = "wallet_faq_works_question_1"
        /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
        case wallet_faq_works_question_2_key = "wallet_faq_works_question_2"
        /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
        case wallet_faq_works_question_3_key = "wallet_faq_works_question_3"
        /// Wie sind meine Daten geschützt?
        case wallet_faq_works_question_4_key = "wallet_faq_works_question_4"
        /// Welche Daten sind im QR-Code enthalten?
        case wallet_faq_works_question_5_key = "wallet_faq_works_question_5"
        /// Was, wenn ich das Covid-Zertifikat oder die App lösche?
        case wallet_faq_works_question_6_key = "wallet_faq_works_question_6"
        /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
        case wallet_faq_works_subtitle_key = "wallet_faq_works_subtitle"
        /// Wie funktioniert \ndie App?
        case wallet_faq_works_title_key = "wallet_faq_works_title"
        /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
        case wallet_homescreen_explanation_key = "wallet_homescreen_explanation"
        /// Akzeptieren
        case wallet_onboarding_accept_button_key = "wallet_onboarding_accept_button"
        /// Die App
        case wallet_onboarding_app_header_key = "wallet_onboarding_app_header"
        /// Mit der App können Sie Covid-Zertifikate sicher auf dem Smartphone aufbewahren und einfach vorweisen.
        case wallet_onboarding_app_text_key = "wallet_onboarding_app_text"
        /// COVID Certificate
        case wallet_onboarding_app_title_key = "wallet_onboarding_app_title"
        /// Datenschutzerklärung &\nNutzungsbedingungen
        case wallet_onboarding_external_privacy_button_key = "wallet_onboarding_external_privacy_button"
        /// Nutzungsbedingungen
        case wallet_onboarding_privacy_conditionsofuse_title_key = "wallet_onboarding_privacy_conditionsofuse_title"
        /// Datenschutz
        case wallet_onboarding_privacy_header_key = "wallet_onboarding_privacy_header"
        /// Datenschutzerklärung
        case wallet_onboarding_privacy_privacypolicy_title_key = "wallet_onboarding_privacy_privacypolicy_title"
        /// Die Zertifikate sind nur lokal auf Ihrem Smartphone hinterlegt. Die Daten werden nicht in einem zentralen System gespeichert.
        case wallet_onboarding_privacy_text_key = "wallet_onboarding_privacy_text"
        /// Ihre Daten bleiben \nin der App
        case wallet_onboarding_privacy_title_key = "wallet_onboarding_privacy_title"
        /// Vorteile
        case wallet_onboarding_show_header_key = "wallet_onboarding_show_header"
        /// Die auf dem Covid-Zertifikat dargestellten Daten sind auch im QR-Code enthalten.
        case wallet_onboarding_show_text1_key = "wallet_onboarding_show_text1"
        /// Beim Vorweisen wird der QR-Code mit einer Prüf-App gescannt. Die enthaltenen Daten werden dabei automatisch auf Echtheit und Gültigkeit überprüft.
        case wallet_onboarding_show_text2_key = "wallet_onboarding_show_text2"
        /// Zertifikate einfach vorweisen
        case wallet_onboarding_show_title_key = "wallet_onboarding_show_title"
        /// Vorteile
        case wallet_onboarding_store_header_key = "wallet_onboarding_store_header"
        /// Covid-Zertifikate können einfach zur App hinzugefügt und digital aufbewahrt werden.
        case wallet_onboarding_store_text1_key = "wallet_onboarding_store_text1"
        /// Die App prüft die Zertifikate auf ihre Gültigkeit in der Schweiz. So können Sie sich versichern, dass Ihre Zertifikate gültig sind.
        case wallet_onboarding_store_text2_key = "wallet_onboarding_store_text2"
        /// Covid-Zertifikate digital aufbewahren
        case wallet_onboarding_store_title_key = "wallet_onboarding_store_title"
        /// Erneut scannen
        case wallet_scan_again_key = "wallet_scan_again"
        /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
        case wallet_scanner_explanation_key = "wallet_scanner_explanation"
        /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
        case wallet_scanner_howitworks_answer1_key = "wallet_scanner_howitworks_answer1"
        /// So funktioniert's
        case wallet_scanner_howitworks_header_key = "wallet_scanner_howitworks_header"
        /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
        case wallet_scanner_howitworks_question1_key = "wallet_scanner_howitworks_question1"
        /// Um ein Covid-Zertifikat zur App hinzufügen zu können, benötigen Sie das Originalzertifikat auf Papier oder als PDF.
        case wallet_scanner_howitworks_text1_key = "wallet_scanner_howitworks_text1"
        /// Tippen Sie in der App auf «Hinzufügen», um ein neues Zertifikat zur App hinzuzufügen.
        case wallet_scanner_howitworks_text2_key = "wallet_scanner_howitworks_text2"
        /// Halten Sie nun die Kamera des Smartphones über den QR-Code auf dem Originalzertifikat, um den Code einzuscannen.
        case wallet_scanner_howitworks_text3_key = "wallet_scanner_howitworks_text3"
        /// Es erscheint eine Vorschau des Covid-Zertifikats. Tippen Sie auf «Hinzufügen» um das Zertifikat sicher in der App zu speichern.
        case wallet_scanner_howitworks_text4_key = "wallet_scanner_howitworks_text4"
        /// Covid-Zertifikate\nhinzufügen
        case wallet_scanner_howitworks_title_key = "wallet_scanner_howitworks_title"
        /// So funktioniert's
        case wallet_scanner_info_button_key = "wallet_scanner_info_button"
        /// Hinzufügen
        case wallet_scanner_title_key = "wallet_scanner_title"
        /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-app.html
        case wallet_terms_privacy_link_key = "wallet_terms_privacy_link"
    }

    /// Zertifikat hinzufügen
    static let accessibility_add_button = UBLocalized.tr(UBLocalizedKey.accessibility_add_button_key)
    /// Schliessen
    static let accessibility_close_button = UBLocalized.tr(UBLocalizedKey.accessibility_close_button_key)
    /// Häufige Fragen
    static let accessibility_faq_button = UBLocalized.tr(UBLocalizedKey.accessibility_faq_button_key)
    /// Information
    static let accessibility_info_box = UBLocalized.tr(UBLocalizedKey.accessibility_info_box_key)
    /// Impressum
    static let accessibility_info_button = UBLocalized.tr(UBLocalizedKey.accessibility_info_button_key)
    /// Taschenlampe ausschalten
    static let accessibility_lamp_off_button = UBLocalized.tr(UBLocalizedKey.accessibility_lamp_off_button_key)
    /// Taschenlampe einschalten
    static let accessibility_lamp_on_button = UBLocalized.tr(UBLocalizedKey.accessibility_lamp_on_button_key)
    /// Zertifikate Liste
    static let accessibility_list_button = UBLocalized.tr(UBLocalizedKey.accessibility_list_button_key)
    /// Zugriff auf Kamera erlauben
    static let camera_permission_dialog_action = UBLocalized.tr(UBLocalizedKey.camera_permission_dialog_action_key)
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
    static let camera_permission_dialog_text = UBLocalized.tr(UBLocalizedKey.camera_permission_dialog_text_key)
    /// Abbrechen
    static let cancel_button = UBLocalized.tr(UBLocalizedKey.cancel_button_key)
    /// Genesen
    static let certificate_reason_recovered = UBLocalized.tr(UBLocalizedKey.certificate_reason_recovered_key)
    /// Test
    static let certificate_reason_tested = UBLocalized.tr(UBLocalizedKey.certificate_reason_tested_key)
    /// Impfung
    static let certificate_reason_vaccinated = UBLocalized.tr(UBLocalizedKey.certificate_reason_vaccinated_key)
    /// Schliessen
    static let close_button = UBLocalized.tr(UBLocalizedKey.close_button_key)
    /// Weiter
    static let continue_button = UBLocalized.tr(UBLocalizedKey.continue_button_key)
    /// Genesung
    static let covid_certificate_recovery_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_recovery_title_key)
    /// Test
    static let covid_certificate_test_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_test_title_key)
    /// Covid-Zertifikat
    static let covid_certificate_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_title_key)
    /// Impfung
    static let covid_certificate_vaccination_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_vaccination_title_key)
    /// Löschen
    static let delete_button = UBLocalized.tr(UBLocalizedKey.delete_button_key)
    /// Einstellungen ändern
    static let error_action_change_settings = UBLocalized.tr(UBLocalizedKey.error_action_change_settings_key)
    /// Erneut versuchen
    static let error_action_retry = UBLocalized.tr(UBLocalizedKey.error_action_retry_key)
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
    static let error_camera_permission_text = UBLocalized.tr(UBLocalizedKey.error_camera_permission_text_key)
    /// Kein Zugriff auf Kamera
    static let error_camera_permission_title = UBLocalized.tr(UBLocalizedKey.error_camera_permission_title_key)
    /// Überprüfen Sie Ihre Internet Verbindung.
    static let error_network_text = UBLocalized.tr(UBLocalizedKey.error_network_text_key)
    /// Netzwerkfehler
    static let error_network_title = UBLocalized.tr(UBLocalizedKey.error_network_title_key)
    /// Fehler
    static let error_title = UBLocalized.tr(UBLocalizedKey.error_title_key)
    /// Aktualisieren
    static let force_update_button = UBLocalized.tr(UBLocalizedKey.force_update_button_key)
    /// Laden Sie die neue Version der App.
    static let force_update_text = UBLocalized.tr(UBLocalizedKey.force_update_text_key)
    /// Update benötigt
    static let force_update_title = UBLocalized.tr(UBLocalizedKey.force_update_title_key)
    /// Impressum
    static let impressum_title = UBLocalized.tr(UBLocalizedKey.impressum_title_key)
    /// Einstellungen
    static let ios_settings_open = UBLocalized.tr(UBLocalizedKey.ios_settings_open_key)
    /// de
    static let language_key = UBLocalized.tr(UBLocalizedKey.language_key_key)
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
    static let NSCameraUsageDescription = UBLocalized.tr(UBLocalizedKey.NSCameraUsageDescription_key)
    /// OK
    static let ok_button = UBLocalized.tr(UBLocalizedKey.ok_button_key)
    /// Kein gültiger Code
    static let qr_scanner_error = UBLocalized.tr(UBLocalizedKey.qr_scanner_error_key)
    /// Covid-19
    static let target_disease_name = UBLocalized.tr(UBLocalizedKey.target_disease_name_key)
    /// Ein unbekannter Fehler ist aufgetreten.
    static let unknown_error = UBLocalized.tr(UBLocalizedKey.unknown_error_key)
    /// Covid Check
    static let verifier_app_name = UBLocalized.tr(UBLocalizedKey.verifier_app_name_key)
    /// COVID Certificate Check
    static let verifier_app_title = UBLocalized.tr(UBLocalizedKey.verifier_app_title_key)
    /// http://itunes.apple.com/app/id1565917510
    static let verifier_apple_app_store_url = UBLocalized.tr(UBLocalizedKey.verifier_apple_app_store_url_key)
    /// Geburtsdatum
    static let verifier_covid_certificate_birthdate = UBLocalized.tr(UBLocalizedKey.verifier_covid_certificate_birthdate_key)
    /// Nachname
    static let verifier_covid_certificate_name = UBLocalized.tr(UBLocalizedKey.verifier_covid_certificate_name_key)
    /// Vorname
    static let verifier_covid_certificate_prename = UBLocalized.tr(UBLocalizedKey.verifier_covid_certificate_prename_key)
    /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App.
    static let verifier_faq_works_answer_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_1_key)
    /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
    static let verifier_faq_works_answer_2 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_2_key)
    /// Als gültige Ausweisdokumente werden Pass oder ID akzeptiert. Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
    static let verifier_faq_works_answer_3 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_3_key)
    /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
    static let verifier_faq_works_answer_4 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_4_key)
    /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
    static let verifier_faq_works_answer_5 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_5_key)
    /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
    static let verifier_faq_works_answer_6 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_6_key)
    /// Wie können Covid-Zertifikate geprüft werden?
    static let verifier_faq_works_question_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_1_key)
    /// Was wird genau geprüft?
    static let verifier_faq_works_question_2 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_2_key)
    /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
    static let verifier_faq_works_question_3 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_3_key)
    /// Können auch ausländische Zertifikate geprüft werden?
    static let verifier_faq_works_question_4 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_4_key)
    /// Welche Daten sehe ich beim Prüfvorgang?
    static let verifier_faq_works_question_5 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_5_key)
    /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
    static let verifier_faq_works_question_6 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_6_key)
    /// Mit der COVID Certificate Check App können QR-Codes auf Covid-Zertifikaten gescannt und die Zertifikate auf Echtheit und Gültigkeit überprüft werden.
    static let verifier_faq_works_subtitle = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_subtitle_key)
    /// So werden Covid-Zertifikate geprüft
    static let verifier_faq_works_title = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_title_key)
    /// Covid Certificate
    static let verifier_homescreen_header_title = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_header_title_key)
    /// Vorgewiesenes Zertifikat scannen
    static let verifier_homescreen_pager_description_1 = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_pager_description_1_key)
    /// Zertifikate werden automatisch geprüft
    static let verifier_homescreen_pager_description_2 = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_pager_description_2_key)
    /// Prüfen
    static let verifier_homescreen_scan_button = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_scan_button_key)
    /// So funktioniert's
    static let verifier_homescreen_support_button = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_support_button_key)
    /// Check
    static let verifier_homescreen_title = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_title_key)
    /// QR-Code scannen\nzum Prüfen
    static let verifier_qr_scanner_scan_qr_text = UBLocalized.tr(UBLocalizedKey.verifier_qr_scanner_scan_qr_text_key)
    /// Das Gerät befindet sich im Flugmodus.
    static let verifier_retry_flightmode_error = UBLocalized.tr(UBLocalizedKey.verifier_retry_flightmode_error_key)
    /// Ein Netzwerkfehler ist aufgetreten.
    static let verifier_retry_network_error = UBLocalized.tr(UBLocalizedKey.verifier_retry_network_error_key)
    /// So funktioniert's
    static let verifier_support_header = UBLocalized.tr(UBLocalizedKey.verifier_support_header_key)
    /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-check-app.html
    static let verifier_terms_privacy_link = UBLocalized.tr(UBLocalizedKey.verifier_terms_privacy_link_key)
    /// Prüfen
    static let verifier_title_qr_scan = UBLocalized.tr(UBLocalizedKey.verifier_title_qr_scan_key)
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz: Die Gültigkeit des Zertifikat ist abgelaufen.
    static let verifier_verifiy_error_expired = UBLocalized.tr(UBLocalizedKey.verifier_verifiy_error_expired_key)
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz: Das Zertifikat ist noch nicht gültig.
    static let verifier_verifiy_error_notyetvalid = UBLocalized.tr(UBLocalizedKey.verifier_verifiy_error_notyetvalid_key)
    /// Das Zertifikat wurde widerrufen
    static let verifier_verify_error_info_for_blacklist = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_info_for_blacklist_key)
    /// Das Zertifikat hat keine gültige Signatur
    static let verifier_verify_error_info_for_certificate_invalid = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_info_for_certificate_invalid_key)
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz
    static let verifier_verify_error_info_for_national_rules = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_info_for_national_rules_key)
    /// Ein unerwarteter Fehler ist aufgetreten.
    static let verifier_verify_error_list_info_text = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_list_info_text_key)
    /// Prüfung fehlgeschlagen
    static let verifier_verify_error_list_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_list_title_key)
    /// Covid-Zertifikat ungültig
    static let verifier_verify_error_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_title_key)
    /// Zertifikat wird geprüft
    static let verifier_verify_loading_text = UBLocalized.tr(UBLocalizedKey.verifier_verify_loading_text_key)
    /// Nur mit einem \nAusweisdokument gültig
    static let verifier_verify_success_info = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_info_key)
    /// Prüfung erfolgreich
    static let verifier_verify_success_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_title_key)
    /// Hinzufügen
    static let wallet_add_certificate = UBLocalized.tr(UBLocalizedKey.wallet_add_certificate_key)
    /// Hinzufügen
    static let wallet_add_certificate_button = UBLocalized.tr(UBLocalizedKey.wallet_add_certificate_button_key)
    /// Covid Cert
    static let wallet_app_name = UBLocalized.tr(UBLocalizedKey.wallet_app_name_key)
    /// http://itunes.apple.com/app/id1565917320
    static let wallet_apple_app_store_url = UBLocalized.tr(UBLocalizedKey.wallet_apple_app_store_url_key)
    /// Covid-Zertifikat
    static let wallet_certificate = UBLocalized.tr(UBLocalizedKey.wallet_certificate_key)
    /// Dieses Zertifikat ist bereits in der App gespeichert
    static let wallet_certificate_already_exists = UBLocalized.tr(UBLocalizedKey.wallet_certificate_already_exists_key)
    /// Zertifikat erstellt am\n{DATE}
    static let wallet_certificate_date = UBLocalized.tr(UBLocalizedKey.wallet_certificate_date_key)
    /// Wollen Sie das Zertifikat wirklich löschen?
    static let wallet_certificate_delete_confirm_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_delete_confirm_text_key)
    /// Diese Bescheinigung ist kein Reisedokument. \n\nDie wissenschaftlichen Erkenntnisse über COVID-19-Impfung, -Genesung und -Tests entwickeln sich weiter, auch im Hinblick auf neue bedenkliche Varianten des Virus. \n\nBitte informieren Sie sich vor der Reise über die geltenden Gesundheitsmassnahmen und die damit verbundenen Einschränkungen am Zielort.
    static let wallet_certificate_detail_note = UBLocalized.tr(UBLocalizedKey.wallet_certificate_detail_note_key)
    /// UVCI
    static let wallet_certificate_identifier = UBLocalized.tr(UBLocalizedKey.wallet_certificate_identifier_key)
    /// Impfdosis
    static let wallet_certificate_impfdosis_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfdosis_title_key)
    /// Hersteller
    static let wallet_certificate_impfstoff_holder = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfstoff_holder_key)
    /// Produkt
    static let wallet_certificate_impfstoff_product_name_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfstoff_product_name_title_key)
    /// Impfstoff
    static let wallet_certificate_impfstoff_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfstoff_title_key)
    /// Zertifikate
    static let wallet_certificate_list_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_list_title_key)
    /// Datum des ersten positiven Resultats
    static let wallet_certificate_recovery_first_positiv_result = UBLocalized.tr(UBLocalizedKey.wallet_certificate_recovery_first_positiv_result_key)
    /// Gültig ab
    static let wallet_certificate_recovery_from = UBLocalized.tr(UBLocalizedKey.wallet_certificate_recovery_from_key)
    /// Gültig bis
    static let wallet_certificate_recovery_until = UBLocalized.tr(UBLocalizedKey.wallet_certificate_recovery_until_key)
    /// Krankheit oder Erreger
    static let wallet_certificate_target_disease_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_target_disease_title_key)
    /// Testcenter
    static let wallet_certificate_test_done_by = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_done_by_key)
    /// Hersteller
    static let wallet_certificate_test_holder = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_holder_key)
    /// Land des Tests
    static let wallet_certificate_test_land = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_land_key)
    /// Name
    static let wallet_certificate_test_name = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_name_key)
    /// Datum Resultat
    static let wallet_certificate_test_result_date_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_date_title_key)
    /// NEGATIV
    static let wallet_certificate_test_result_negativ = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_negativ_key)
    /// POSITIV
    static let wallet_certificate_test_result_positiv = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_positiv_key)
    /// Ergebnis
    static let wallet_certificate_test_result_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_title_key)
    /// Datum der Probenentnahme
    static let wallet_certificate_test_sample_date_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_sample_date_title_key)
    /// Typ
    static let wallet_certificate_test_type = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_type_key)
    /// Land der Impfung
    static let wallet_certificate_vaccination_country_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_vaccination_country_title_key)
    /// Impfdatum
    static let wallet_certificate_vaccination_date_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_vaccination_date_title_key)
    /// Herausgeber
    static let wallet_certificate_vaccination_issuer_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_vaccination_issuer_title_key)
    /// Art des Impfstoffs
    static let wallet_certificate_vaccine_prophylaxis = UBLocalized.tr(UBLocalizedKey.wallet_certificate_vaccine_prophylaxis_key)
    /// In der Schweiz gültig ab:\n{DATE}
    static let wallet_certificate_valid_from = UBLocalized.tr(UBLocalizedKey.wallet_certificate_valid_from_key)
    /// bis
    static let wallet_certificate_valid_until = UBLocalized.tr(UBLocalizedKey.wallet_certificate_valid_until_key)
    /// Gültigkeit in der\nSchweiz
    static let wallet_certificate_validity = UBLocalized.tr(UBLocalizedKey.wallet_certificate_validity_key)
    /// Prüfung erfolgreich
    static let wallet_certificate_verify_success = UBLocalized.tr(UBLocalizedKey.wallet_certificate_verify_success_key)
    /// Das Zertifikat wird geprüft
    static let wallet_certificate_verifying = UBLocalized.tr(UBLocalizedKey.wallet_certificate_verifying_key)
    /// Gültigkeit des Zertifikats\nabgelaufen
    static let wallet_error_expired = UBLocalized.tr(UBLocalizedKey.wallet_error_expired_key)
    /// abgelaufen
    static let wallet_error_expired_bold = UBLocalized.tr(UBLocalizedKey.wallet_error_expired_bold_key)
    /// Zertifikat mit\nungültiger Signatur
    static let wallet_error_invalid_signature = UBLocalized.tr(UBLocalizedKey.wallet_error_invalid_signature_key)
    /// ungültiger Signatur
    static let wallet_error_invalid_signature_bold = UBLocalized.tr(UBLocalizedKey.wallet_error_invalid_signature_bold_key)
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz
    static let wallet_error_national_rules = UBLocalized.tr(UBLocalizedKey.wallet_error_national_rules_key)
    /// Zertifikat wurde\nwiderrufen
    static let wallet_error_revocation = UBLocalized.tr(UBLocalizedKey.wallet_error_revocation_key)
    /// widerrufen
    static let wallet_error_revocation_bold = UBLocalized.tr(UBLocalizedKey.wallet_error_revocation_bold_key)
    /// In der Schweiz gültig ab:\n{DATE}
    static let wallet_error_valid_from = UBLocalized.tr(UBLocalizedKey.wallet_error_valid_from_key)
    /// Häufige Fragen
    static let wallet_faq_header = UBLocalized.tr(UBLocalizedKey.wallet_faq_header_key)
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
    static let wallet_faq_questions_answer_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_1_key)
    /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass sie in jedem Fall auch noch ein Ausweisdokument (Pass oder ID) vorweisen müssen.
    static let wallet_faq_questions_answer_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_2_key)
    /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
    static let wallet_faq_questions_answer_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_3_key)
    /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument (Pass oder ID) gültig.
    static let wallet_faq_questions_answer_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_4_key)
    /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier deshalb sorgfältig auf. Bei Verlust müssen Sie das Covid-Zertifikat erneut bei der ausgebenden Stelle anfragen.
    static let wallet_faq_questions_answer_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_5_key)
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
    static let wallet_faq_questions_question_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_1_key)
    /// Wie kann ich ein Covid-Zertifikat vorweisen?
    static let wallet_faq_questions_question_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_2_key)
    /// Wo sind meine Daten gespeichert?
    static let wallet_faq_questions_question_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_3_key)
    /// Wie werden Missbrauch und Fälschung verhindert?
    static let wallet_faq_questions_question_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_4_key)
    /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
    static let wallet_faq_questions_question_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_5_key)
    /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
    static let wallet_faq_questions_subtitle = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_subtitle_key)
    /// Was sind Covid-Zertifikate?
    static let wallet_faq_questions_title = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_title_key)
    /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
    static let wallet_faq_works_answer_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_1_key)
    /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument (Pass oder ID) des Zertifikatsinhabers gültig.
    static let wallet_faq_works_answer_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_2_key)
    /// In der COVID Certificate App wird ausgewiesen, wann Ihr Covid-Zertifikat in der Schweiz ablaufen wird. Sie können in der Detail-Ansicht zudem per Knopfdruck überprüfen, ob Ihr Covid-Zertifikat aktuell gültig ist.
    static let wallet_faq_works_answer_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_3_key)
    /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
    static let wallet_faq_works_answer_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_4_key)
    /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
    static let wallet_faq_works_answer_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_5_key)
    /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihr Mobilgerät bringen. Scannen Sie dazu erneut den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
    static let wallet_faq_works_answer_6 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_6_key)
    /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
    static let wallet_faq_works_question_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_1_key)
    /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
    static let wallet_faq_works_question_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_2_key)
    /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
    static let wallet_faq_works_question_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_3_key)
    /// Wie sind meine Daten geschützt?
    static let wallet_faq_works_question_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_4_key)
    /// Welche Daten sind im QR-Code enthalten?
    static let wallet_faq_works_question_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_5_key)
    /// Was, wenn ich das Covid-Zertifikat oder die App lösche?
    static let wallet_faq_works_question_6 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_6_key)
    /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
    static let wallet_faq_works_subtitle = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_subtitle_key)
    /// Wie funktioniert \ndie App?
    static let wallet_faq_works_title = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_title_key)
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
    static let wallet_homescreen_explanation = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_explanation_key)
    /// Akzeptieren
    static let wallet_onboarding_accept_button = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_accept_button_key)
    /// Die App
    static let wallet_onboarding_app_header = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_app_header_key)
    /// Mit der App können Sie Covid-Zertifikate sicher auf dem Smartphone aufbewahren und einfach vorweisen.
    static let wallet_onboarding_app_text = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_app_text_key)
    /// COVID Certificate
    static let wallet_onboarding_app_title = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_app_title_key)
    /// Datenschutzerklärung &\nNutzungsbedingungen
    static let wallet_onboarding_external_privacy_button = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_external_privacy_button_key)
    /// Nutzungsbedingungen
    static let wallet_onboarding_privacy_conditionsofuse_title = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_privacy_conditionsofuse_title_key)
    /// Datenschutz
    static let wallet_onboarding_privacy_header = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_privacy_header_key)
    /// Datenschutzerklärung
    static let wallet_onboarding_privacy_privacypolicy_title = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_privacy_privacypolicy_title_key)
    /// Die Zertifikate sind nur lokal auf Ihrem Smartphone hinterlegt. Die Daten werden nicht in einem zentralen System gespeichert.
    static let wallet_onboarding_privacy_text = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_privacy_text_key)
    /// Ihre Daten bleiben \nin der App
    static let wallet_onboarding_privacy_title = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_privacy_title_key)
    /// Vorteile
    static let wallet_onboarding_show_header = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_show_header_key)
    /// Die auf dem Covid-Zertifikat dargestellten Daten sind auch im QR-Code enthalten.
    static let wallet_onboarding_show_text1 = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_show_text1_key)
    /// Beim Vorweisen wird der QR-Code mit einer Prüf-App gescannt. Die enthaltenen Daten werden dabei automatisch auf Echtheit und Gültigkeit überprüft.
    static let wallet_onboarding_show_text2 = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_show_text2_key)
    /// Zertifikate einfach vorweisen
    static let wallet_onboarding_show_title = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_show_title_key)
    /// Vorteile
    static let wallet_onboarding_store_header = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_store_header_key)
    /// Covid-Zertifikate können einfach zur App hinzugefügt und digital aufbewahrt werden.
    static let wallet_onboarding_store_text1 = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_store_text1_key)
    /// Die App prüft die Zertifikate auf ihre Gültigkeit in der Schweiz. So können Sie sich versichern, dass Ihre Zertifikate gültig sind.
    static let wallet_onboarding_store_text2 = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_store_text2_key)
    /// Covid-Zertifikate digital aufbewahren
    static let wallet_onboarding_store_title = UBLocalized.tr(UBLocalizedKey.wallet_onboarding_store_title_key)
    /// Erneut scannen
    static let wallet_scan_again = UBLocalized.tr(UBLocalizedKey.wallet_scan_again_key)
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
    static let wallet_scanner_explanation = UBLocalized.tr(UBLocalizedKey.wallet_scanner_explanation_key)
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
    static let wallet_scanner_howitworks_answer1 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_answer1_key)
    /// So funktioniert's
    static let wallet_scanner_howitworks_header = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_header_key)
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
    static let wallet_scanner_howitworks_question1 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_question1_key)
    /// Um ein Covid-Zertifikat zur App hinzufügen zu können, benötigen Sie das Originalzertifikat auf Papier oder als PDF.
    static let wallet_scanner_howitworks_text1 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_text1_key)
    /// Tippen Sie in der App auf «Hinzufügen», um ein neues Zertifikat zur App hinzuzufügen.
    static let wallet_scanner_howitworks_text2 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_text2_key)
    /// Halten Sie nun die Kamera des Smartphones über den QR-Code auf dem Originalzertifikat, um den Code einzuscannen.
    static let wallet_scanner_howitworks_text3 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_text3_key)
    /// Es erscheint eine Vorschau des Covid-Zertifikats. Tippen Sie auf «Hinzufügen» um das Zertifikat sicher in der App zu speichern.
    static let wallet_scanner_howitworks_text4 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_text4_key)
    /// Covid-Zertifikate\nhinzufügen
    static let wallet_scanner_howitworks_title = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_title_key)
    /// So funktioniert's
    static let wallet_scanner_info_button = UBLocalized.tr(UBLocalizedKey.wallet_scanner_info_button_key)
    /// Hinzufügen
    static let wallet_scanner_title = UBLocalized.tr(UBLocalizedKey.wallet_scanner_title_key)
    /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-app.html
    static let wallet_terms_privacy_link = UBLocalized.tr(UBLocalizedKey.wallet_terms_privacy_link_key)
}

// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension UBLocalized {
    private static func tr(_ key: UBLocalizedKey, _ table: String = "Localizable", _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key.rawValue, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

extension UBLocalized {
    public static func translate(_ key: UBLocalizedKey, languageKey: String? = nil, table: String = "Localizable", _ args: CVarArg...) -> String {
        guard let languageKey = languageKey else {
            return tr(key, table, args)
        }

        guard let bundlePath = BundleToken.bundle.path(forResource: languageKey, ofType: "lproj"), let bundle = Bundle(path: bundlePath)
        else { return "" }
        return String(format: NSLocalizedString(key.rawValue, bundle: bundle, value: "", comment: ""), locale: Locale.current, arguments: args)
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
