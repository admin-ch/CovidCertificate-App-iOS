// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
enum UBLocalized {
    /// Zertifikat hinzufügen
    static let accessibility_add_button = UBLocalized.tr("Localizable", "accessibility_add_button")
    /// Schliessen
    static let accessibility_close_button = UBLocalized.tr("Localizable", "accessibility_close_button")
    /// Häufige Fragen
    static let accessibility_faq_button = UBLocalized.tr("Localizable", "accessibility_faq_button")
    /// Information
    static let accessibility_info_box = UBLocalized.tr("Localizable", "accessibility_info_box")
    /// Impressum
    static let accessibility_info_button = UBLocalized.tr("Localizable", "accessibility_info_button")
    /// Taschenlampe ausschalten
    static let accessibility_lamp_off_button = UBLocalized.tr("Localizable", "accessibility_lamp_off_button")
    /// Taschenlampe einschalten
    static let accessibility_lamp_on_button = UBLocalized.tr("Localizable", "accessibility_lamp_on_button")
    /// Zertifikate Liste
    static let accessibility_list_button = UBLocalized.tr("Localizable", "accessibility_list_button")
    /// Zugriff auf Kamera erlauben
    static let camera_permission_dialog_action = UBLocalized.tr("Localizable", "camera_permission_dialog_action")
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
    static let camera_permission_dialog_text = UBLocalized.tr("Localizable", "camera_permission_dialog_text")
    /// Abbrechen
    static let cancel_button = UBLocalized.tr("Localizable", "cancel_button")
    /// Genesen
    static let certificate_reason_recovered = UBLocalized.tr("Localizable", "certificate_reason_recovered")
    /// Test
    static let certificate_reason_tested = UBLocalized.tr("Localizable", "certificate_reason_tested")
    /// Impfung
    static let certificate_reason_vaccinated = UBLocalized.tr("Localizable", "certificate_reason_vaccinated")
    /// Schliessen
    static let close_button = UBLocalized.tr("Localizable", "close_button")
    /// Weiter
    static let continue_button = UBLocalized.tr("Localizable", "continue_button")
    /// Genesung
    static let covid_certificate_recovery_title = UBLocalized.tr("Localizable", "covid_certificate_recovery_title")
    /// Test
    static let covid_certificate_test_title = UBLocalized.tr("Localizable", "covid_certificate_test_title")
    /// Covid-Zertifikat
    static let covid_certificate_title = UBLocalized.tr("Localizable", "covid_certificate_title")
    /// Impfung
    static let covid_certificate_vaccination_title = UBLocalized.tr("Localizable", "covid_certificate_vaccination_title")
    /// Löschen
    static let delete_button = UBLocalized.tr("Localizable", "delete_button")
    /// Einstellungen ändern
    static let error_action_change_settings = UBLocalized.tr("Localizable", "error_action_change_settings")
    /// Erneut versuchen
    static let error_action_retry = UBLocalized.tr("Localizable", "error_action_retry")
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
    static let error_camera_permission_text = UBLocalized.tr("Localizable", "error_camera_permission_text")
    /// Kein Zugriff auf Kamera
    static let error_camera_permission_title = UBLocalized.tr("Localizable", "error_camera_permission_title")
    /// Überprüfen Sie Ihre Internet Verbindung.
    static let error_network_text = UBLocalized.tr("Localizable", "error_network_text")
    /// Netzwerkfehler
    static let error_network_title = UBLocalized.tr("Localizable", "error_network_title")
    /// Fehler
    static let error_title = UBLocalized.tr("Localizable", "error_title")
    /// Aktualisieren
    static let force_update_button = UBLocalized.tr("Localizable", "force_update_button")
    /// Laden Sie die neue Version der App.
    static let force_update_text = UBLocalized.tr("Localizable", "force_update_text")
    /// Update benötigt
    static let force_update_title = UBLocalized.tr("Localizable", "force_update_title")
    /// Impressum
    static let impressum_title = UBLocalized.tr("Localizable", "impressum_title")
    /// Einstellungen
    static let ios_settings_open = UBLocalized.tr("Localizable", "ios_settings_open")
    /// de
    static let language_key = UBLocalized.tr("Localizable", "language_key")
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
    static let NSCameraUsageDescription = UBLocalized.tr("Localizable", "NSCameraUsageDescription")
    /// OK
    static let ok_button = UBLocalized.tr("Localizable", "ok_button")
    /// Kein gültiger Code
    static let qr_scanner_error = UBLocalized.tr("Localizable", "qr_scanner_error")
    /// Covid-19
    static let target_disease_name = UBLocalized.tr("Localizable", "target_disease_name")
    /// Ein unbekannter Fehler ist aufgetreten.
    static let unknown_error = UBLocalized.tr("Localizable", "unknown_error")
    /// Covid Check
    static let verifier_app_name = UBLocalized.tr("Localizable", "verifier_app_name")
    /// COVID Certificate Check
    static let verifier_app_title = UBLocalized.tr("Localizable", "verifier_app_title")
    /// http://itunes.apple.com/app/id1565917510
    static let verifier_apple_app_store_url = UBLocalized.tr("Localizable", "verifier_apple_app_store_url")
    /// Geburtsdatum
    static let verifier_covid_certificate_birthdate = UBLocalized.tr("Localizable", "verifier_covid_certificate_birthdate")
    /// Nachname
    static let verifier_covid_certificate_name = UBLocalized.tr("Localizable", "verifier_covid_certificate_name")
    /// Vorname
    static let verifier_covid_certificate_prename = UBLocalized.tr("Localizable", "verifier_covid_certificate_prename")
    /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App.
    static let verifier_faq_works_answer_1 = UBLocalized.tr("Localizable", "verifier_faq_works_answer_1")
    /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
    static let verifier_faq_works_answer_2 = UBLocalized.tr("Localizable", "verifier_faq_works_answer_2")
    /// Als gültige Ausweisdokumente werden Pass oder ID akzeptiert. Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
    static let verifier_faq_works_answer_3 = UBLocalized.tr("Localizable", "verifier_faq_works_answer_3")
    /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
    static let verifier_faq_works_answer_4 = UBLocalized.tr("Localizable", "verifier_faq_works_answer_4")
    /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
    static let verifier_faq_works_answer_5 = UBLocalized.tr("Localizable", "verifier_faq_works_answer_5")
    /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
    static let verifier_faq_works_answer_6 = UBLocalized.tr("Localizable", "verifier_faq_works_answer_6")
    /// Wie können Covid-Zertifikate geprüft werden?
    static let verifier_faq_works_question_1 = UBLocalized.tr("Localizable", "verifier_faq_works_question_1")
    /// Was wird genau geprüft?
    static let verifier_faq_works_question_2 = UBLocalized.tr("Localizable", "verifier_faq_works_question_2")
    /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
    static let verifier_faq_works_question_3 = UBLocalized.tr("Localizable", "verifier_faq_works_question_3")
    /// Können auch ausländische Zertifikate geprüft werden?
    static let verifier_faq_works_question_4 = UBLocalized.tr("Localizable", "verifier_faq_works_question_4")
    /// Welche Daten sehe ich beim Prüfvorgang?
    static let verifier_faq_works_question_5 = UBLocalized.tr("Localizable", "verifier_faq_works_question_5")
    /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
    static let verifier_faq_works_question_6 = UBLocalized.tr("Localizable", "verifier_faq_works_question_6")
    /// Mit der COVID Certificate Check App können QR-Codes auf Covid-Zertifikaten gescannt und die Zertifikate auf Echtheit und Gültigkeit überprüft werden.
    static let verifier_faq_works_subtitle = UBLocalized.tr("Localizable", "verifier_faq_works_subtitle")
    /// So werden Covid-Zertifikate geprüft
    static let verifier_faq_works_title = UBLocalized.tr("Localizable", "verifier_faq_works_title")
    /// Covid Certificate
    static let verifier_homescreen_header_title = UBLocalized.tr("Localizable", "verifier_homescreen_header_title")
    /// Vorgewiesenes Zertifikat scannen
    static let verifier_homescreen_pager_description_1 = UBLocalized.tr("Localizable", "verifier_homescreen_pager_description_1")
    /// Zertifikate werden automatisch geprüft
    static let verifier_homescreen_pager_description_2 = UBLocalized.tr("Localizable", "verifier_homescreen_pager_description_2")
    /// Prüfen
    static let verifier_homescreen_scan_button = UBLocalized.tr("Localizable", "verifier_homescreen_scan_button")
    /// So funktioniert's
    static let verifier_homescreen_support_button = UBLocalized.tr("Localizable", "verifier_homescreen_support_button")
    /// Check
    static let verifier_homescreen_title = UBLocalized.tr("Localizable", "verifier_homescreen_title")
    /// QR-Code scannen\nzum Prüfen
    static let verifier_qr_scanner_scan_qr_text = UBLocalized.tr("Localizable", "verifier_qr_scanner_scan_qr_text")
    /// Das Gerät befindet sich im Flugmodus.
    static let verifier_retry_flightmode_error = UBLocalized.tr("Localizable", "verifier_retry_flightmode_error")
    /// Ein Netzwerkfehler ist aufgetreten.
    static let verifier_retry_network_error = UBLocalized.tr("Localizable", "verifier_retry_network_error")
    /// So funktioniert's
    static let verifier_support_header = UBLocalized.tr("Localizable", "verifier_support_header")
    /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-check-app.html
    static let verifier_terms_privacy_link = UBLocalized.tr("Localizable", "verifier_terms_privacy_link")
    /// Prüfen
    static let verifier_title_qr_scan = UBLocalized.tr("Localizable", "verifier_title_qr_scan")
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz: Die Gültigkeit des Zertifikat ist abgelaufen.
    static let verifier_verifiy_error_expired = UBLocalized.tr("Localizable", "verifier_verifiy_error_expired")
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz: Das Zertifikat ist noch nicht gültig.
    static let verifier_verifiy_error_notyetvalid = UBLocalized.tr("Localizable", "verifier_verifiy_error_notyetvalid")
    /// Das Zertifikat wurde widerrufen
    static let verifier_verify_error_info_for_blacklist = UBLocalized.tr("Localizable", "verifier_verify_error_info_for_blacklist")
    /// Das Zertifikat hat keine gültige Signatur
    static let verifier_verify_error_info_for_certificate_invalid = UBLocalized.tr("Localizable", "verifier_verify_error_info_for_certificate_invalid")
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz
    static let verifier_verify_error_info_for_national_rules = UBLocalized.tr("Localizable", "verifier_verify_error_info_for_national_rules")
    /// Ein unerwarteter Fehler ist aufgetreten.
    static let verifier_verify_error_list_info_text = UBLocalized.tr("Localizable", "verifier_verify_error_list_info_text")
    /// Prüfung fehlgeschlagen
    static let verifier_verify_error_list_title = UBLocalized.tr("Localizable", "verifier_verify_error_list_title")
    /// Covid-Zertifikat ungültig
    static let verifier_verify_error_title = UBLocalized.tr("Localizable", "verifier_verify_error_title")
    /// Zertifikat wird geprüft
    static let verifier_verify_loading_text = UBLocalized.tr("Localizable", "verifier_verify_loading_text")
    /// Nur mit einem \nAusweisdokument gültig
    static let verifier_verify_success_info = UBLocalized.tr("Localizable", "verifier_verify_success_info")
    /// Prüfung erfolgreich
    static let verifier_verify_success_title = UBLocalized.tr("Localizable", "verifier_verify_success_title")
    /// Hinzufügen
    static let wallet_add_certificate = UBLocalized.tr("Localizable", "wallet_add_certificate")
    /// Hinzufügen
    static let wallet_add_certificate_button = UBLocalized.tr("Localizable", "wallet_add_certificate_button")
    /// Covid Cert
    static let wallet_app_name = UBLocalized.tr("Localizable", "wallet_app_name")
    /// http://itunes.apple.com/app/id1565917320
    static let wallet_apple_app_store_url = UBLocalized.tr("Localizable", "wallet_apple_app_store_url")
    /// Covid-Zertifikat
    static let wallet_certificate = UBLocalized.tr("Localizable", "wallet_certificate")
    /// Dieses Zertifikat ist bereits in der App gespeichert
    static let wallet_certificate_already_exists = UBLocalized.tr("Localizable", "wallet_certificate_already_exists")
    /// Zertifikat erstellt am\n{DATE}
    static let wallet_certificate_date = UBLocalized.tr("Localizable", "wallet_certificate_date")
    /// Wollen Sie das Zertifikat wirklich löschen?
    static let wallet_certificate_delete_confirm_text = UBLocalized.tr("Localizable", "wallet_certificate_delete_confirm_text")
    /// Diese Bescheinigung ist kein Reisedokument. \n\nDie wissenschaftlichen Erkenntnisse über COVID-19-Impfung, -Genesung und -Tests entwickeln sich weiter, auch im Hinblick auf neue bedenkliche Varianten des Virus. \n\nBitte informieren Sie sich vor der Reise über die geltenden Gesundheitsmassnahmen und die damit verbundenen Einschränkungen am Zielort.
    static let wallet_certificate_detail_note = UBLocalized.tr("Localizable", "wallet_certificate_detail_note")
    /// UVCI
    static let wallet_certificate_identifier = UBLocalized.tr("Localizable", "wallet_certificate_identifier")
    /// Impfdosis
    static let wallet_certificate_impfdosis_title = UBLocalized.tr("Localizable", "wallet_certificate_impfdosis_title")
    /// Hersteller
    static let wallet_certificate_impfstoff_holder = UBLocalized.tr("Localizable", "wallet_certificate_impfstoff_holder")
    /// Produkt
    static let wallet_certificate_impfstoff_product_name_title = UBLocalized.tr("Localizable", "wallet_certificate_impfstoff_product_name_title")
    /// Impfstoff
    static let wallet_certificate_impfstoff_title = UBLocalized.tr("Localizable", "wallet_certificate_impfstoff_title")
    /// Zertifikate
    static let wallet_certificate_list_title = UBLocalized.tr("Localizable", "wallet_certificate_list_title")
    /// Datum des ersten positiven Resultats
    static let wallet_certificate_recovery_first_positiv_result = UBLocalized.tr("Localizable", "wallet_certificate_recovery_first_positiv_result")
    /// Gültig ab
    static let wallet_certificate_recovery_from = UBLocalized.tr("Localizable", "wallet_certificate_recovery_from")
    /// Gültig bis
    static let wallet_certificate_recovery_until = UBLocalized.tr("Localizable", "wallet_certificate_recovery_until")
    /// Krankheit oder Erreger
    static let wallet_certificate_target_disease_title = UBLocalized.tr("Localizable", "wallet_certificate_target_disease_title")
    /// Testcenter
    static let wallet_certificate_test_done_by = UBLocalized.tr("Localizable", "wallet_certificate_test_done_by")
    /// Hersteller
    static let wallet_certificate_test_holder = UBLocalized.tr("Localizable", "wallet_certificate_test_holder")
    /// Land des Tests
    static let wallet_certificate_test_land = UBLocalized.tr("Localizable", "wallet_certificate_test_land")
    /// Name
    static let wallet_certificate_test_name = UBLocalized.tr("Localizable", "wallet_certificate_test_name")
    /// Datum Resultat
    static let wallet_certificate_test_result_date_title = UBLocalized.tr("Localizable", "wallet_certificate_test_result_date_title")
    /// NEGATIV
    static let wallet_certificate_test_result_negativ = UBLocalized.tr("Localizable", "wallet_certificate_test_result_negativ")
    /// POSITIV
    static let wallet_certificate_test_result_positiv = UBLocalized.tr("Localizable", "wallet_certificate_test_result_positiv")
    /// Ergebnis
    static let wallet_certificate_test_result_title = UBLocalized.tr("Localizable", "wallet_certificate_test_result_title")
    /// Datum der Probenentnahme
    static let wallet_certificate_test_sample_date_title = UBLocalized.tr("Localizable", "wallet_certificate_test_sample_date_title")
    /// Typ
    static let wallet_certificate_test_type = UBLocalized.tr("Localizable", "wallet_certificate_test_type")
    /// Land der Impfung
    static let wallet_certificate_vaccination_country_title = UBLocalized.tr("Localizable", "wallet_certificate_vaccination_country_title")
    /// Impfdatum
    static let wallet_certificate_vaccination_date_title = UBLocalized.tr("Localizable", "wallet_certificate_vaccination_date_title")
    /// Herausgeber
    static let wallet_certificate_vaccination_issuer_title = UBLocalized.tr("Localizable", "wallet_certificate_vaccination_issuer_title")
    /// Art des Impfstoffs
    static let wallet_certificate_vaccine_prophylaxis = UBLocalized.tr("Localizable", "wallet_certificate_vaccine_prophylaxis")
    /// In der Schweiz gültig ab:\n{DATE}
    static let wallet_certificate_valid_from = UBLocalized.tr("Localizable", "wallet_certificate_valid_from")
    /// bis
    static let wallet_certificate_valid_until = UBLocalized.tr("Localizable", "wallet_certificate_valid_until")
    /// Gültigkeit in der\nSchweiz
    static let wallet_certificate_validity = UBLocalized.tr("Localizable", "wallet_certificate_validity")
    /// Prüfung erfolgreich
    static let wallet_certificate_verify_success = UBLocalized.tr("Localizable", "wallet_certificate_verify_success")
    /// Das Zertifikat wird geprüft
    static let wallet_certificate_verifying = UBLocalized.tr("Localizable", "wallet_certificate_verifying")
    /// Gültigkeit des Zertifikats\nabgelaufen
    static let wallet_error_expired = UBLocalized.tr("Localizable", "wallet_error_expired")
    /// abgelaufen
    static let wallet_error_expired_bold = UBLocalized.tr("Localizable", "wallet_error_expired_bold")
    /// Zertifikat mit\nungültiger Signatur
    static let wallet_error_invalid_signature = UBLocalized.tr("Localizable", "wallet_error_invalid_signature")
    /// ungültiger Signatur
    static let wallet_error_invalid_signature_bold = UBLocalized.tr("Localizable", "wallet_error_invalid_signature_bold")
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz
    static let wallet_error_national_rules = UBLocalized.tr("Localizable", "wallet_error_national_rules")
    /// Zertifikat wurde\nwiderrufen
    static let wallet_error_revocation = UBLocalized.tr("Localizable", "wallet_error_revocation")
    /// widerrufen
    static let wallet_error_revocation_bold = UBLocalized.tr("Localizable", "wallet_error_revocation_bold")
    /// In der Schweiz gültig ab:\n{DATE}
    static let wallet_error_valid_from = UBLocalized.tr("Localizable", "wallet_error_valid_from")
    /// Häufige Fragen
    static let wallet_faq_header = UBLocalized.tr("Localizable", "wallet_faq_header")
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
    static let wallet_faq_questions_answer_1 = UBLocalized.tr("Localizable", "wallet_faq_questions_answer_1")
    /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass sie in jedem Fall auch noch ein Ausweisdokument (Pass oder ID) vorweisen müssen.
    static let wallet_faq_questions_answer_2 = UBLocalized.tr("Localizable", "wallet_faq_questions_answer_2")
    /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
    static let wallet_faq_questions_answer_3 = UBLocalized.tr("Localizable", "wallet_faq_questions_answer_3")
    /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument (Pass oder ID) gültig.
    static let wallet_faq_questions_answer_4 = UBLocalized.tr("Localizable", "wallet_faq_questions_answer_4")
    /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier deshalb sorgfältig auf. Bei Verlust müssen Sie das Covid-Zertifikat erneut bei der ausgebenden Stelle anfragen.
    static let wallet_faq_questions_answer_5 = UBLocalized.tr("Localizable", "wallet_faq_questions_answer_5")
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
    static let wallet_faq_questions_question_1 = UBLocalized.tr("Localizable", "wallet_faq_questions_question_1")
    /// Wie kann ich ein Covid-Zertifikat vorweisen?
    static let wallet_faq_questions_question_2 = UBLocalized.tr("Localizable", "wallet_faq_questions_question_2")
    /// Wo sind meine Daten gespeichert?
    static let wallet_faq_questions_question_3 = UBLocalized.tr("Localizable", "wallet_faq_questions_question_3")
    /// Wie werden Missbrauch und Fälschung verhindert?
    static let wallet_faq_questions_question_4 = UBLocalized.tr("Localizable", "wallet_faq_questions_question_4")
    /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
    static let wallet_faq_questions_question_5 = UBLocalized.tr("Localizable", "wallet_faq_questions_question_5")
    /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
    static let wallet_faq_questions_subtitle = UBLocalized.tr("Localizable", "wallet_faq_questions_subtitle")
    /// Was sind Covid-Zertifikate?
    static let wallet_faq_questions_title = UBLocalized.tr("Localizable", "wallet_faq_questions_title")
    /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
    static let wallet_faq_works_answer_1 = UBLocalized.tr("Localizable", "wallet_faq_works_answer_1")
    /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument (Pass oder ID) des Zertifikatsinhabers gültig.
    static let wallet_faq_works_answer_2 = UBLocalized.tr("Localizable", "wallet_faq_works_answer_2")
    /// In der COVID Certificate App wird ausgewiesen, wann Ihr Covid-Zertifikat in der Schweiz ablaufen wird. Sie können in der Detail-Ansicht zudem per Knopfdruck überprüfen, ob Ihr Covid-Zertifikat aktuell gültig ist.
    static let wallet_faq_works_answer_3 = UBLocalized.tr("Localizable", "wallet_faq_works_answer_3")
    /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
    static let wallet_faq_works_answer_4 = UBLocalized.tr("Localizable", "wallet_faq_works_answer_4")
    /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
    static let wallet_faq_works_answer_5 = UBLocalized.tr("Localizable", "wallet_faq_works_answer_5")
    /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihr Mobilgerät bringen. Scannen Sie dazu erneut den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
    static let wallet_faq_works_answer_6 = UBLocalized.tr("Localizable", "wallet_faq_works_answer_6")
    /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
    static let wallet_faq_works_question_1 = UBLocalized.tr("Localizable", "wallet_faq_works_question_1")
    /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
    static let wallet_faq_works_question_2 = UBLocalized.tr("Localizable", "wallet_faq_works_question_2")
    /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
    static let wallet_faq_works_question_3 = UBLocalized.tr("Localizable", "wallet_faq_works_question_3")
    /// Wie sind meine Daten geschützt?
    static let wallet_faq_works_question_4 = UBLocalized.tr("Localizable", "wallet_faq_works_question_4")
    /// Welche Daten sind im QR-Code enthalten?
    static let wallet_faq_works_question_5 = UBLocalized.tr("Localizable", "wallet_faq_works_question_5")
    /// Was, wenn ich das Covid-Zertifikat oder die App lösche?
    static let wallet_faq_works_question_6 = UBLocalized.tr("Localizable", "wallet_faq_works_question_6")
    /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
    static let wallet_faq_works_subtitle = UBLocalized.tr("Localizable", "wallet_faq_works_subtitle")
    /// Wie funktioniert \ndie App?
    static let wallet_faq_works_title = UBLocalized.tr("Localizable", "wallet_faq_works_title")
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
    static let wallet_homescreen_explanation = UBLocalized.tr("Localizable", "wallet_homescreen_explanation")
    /// Akzeptieren
    static let wallet_onboarding_accept_button = UBLocalized.tr("Localizable", "wallet_onboarding_accept_button")
    /// Die App
    static let wallet_onboarding_app_header = UBLocalized.tr("Localizable", "wallet_onboarding_app_header")
    /// Mit der App können Sie Covid-Zertifikate sicher auf dem Smartphone aufbewahren und einfach vorweisen.
    static let wallet_onboarding_app_text = UBLocalized.tr("Localizable", "wallet_onboarding_app_text")
    /// COVID Certificate
    static let wallet_onboarding_app_title = UBLocalized.tr("Localizable", "wallet_onboarding_app_title")
    /// Datenschutzerklärung &\nNutzungsbedingungen
    static let wallet_onboarding_external_privacy_button = UBLocalized.tr("Localizable", "wallet_onboarding_external_privacy_button")
    /// Nutzungsbedingungen
    static let wallet_onboarding_privacy_conditionsofuse_title = UBLocalized.tr("Localizable", "wallet_onboarding_privacy_conditionsofuse_title")
    /// Datenschutz
    static let wallet_onboarding_privacy_header = UBLocalized.tr("Localizable", "wallet_onboarding_privacy_header")
    /// Datenschutzerklärung
    static let wallet_onboarding_privacy_privacypolicy_title = UBLocalized.tr("Localizable", "wallet_onboarding_privacy_privacypolicy_title")
    /// Die Zertifikate sind nur lokal auf Ihrem Smartphone hinterlegt. Die Daten werden nicht in einem zentralen System gespeichert.
    static let wallet_onboarding_privacy_text = UBLocalized.tr("Localizable", "wallet_onboarding_privacy_text")
    /// Ihre Daten bleiben \nin der App
    static let wallet_onboarding_privacy_title = UBLocalized.tr("Localizable", "wallet_onboarding_privacy_title")
    /// Vorteile
    static let wallet_onboarding_show_header = UBLocalized.tr("Localizable", "wallet_onboarding_show_header")
    /// Die auf dem Covid-Zertifikat dargestellten Daten sind auch im QR-Code enthalten.
    static let wallet_onboarding_show_text1 = UBLocalized.tr("Localizable", "wallet_onboarding_show_text1")
    /// Beim Vorweisen wird der QR-Code mit einer Prüf-App gescannt. Die enthaltenen Daten werden dabei automatisch auf Echtheit und Gültigkeit überprüft.
    static let wallet_onboarding_show_text2 = UBLocalized.tr("Localizable", "wallet_onboarding_show_text2")
    /// Zertifikate einfach vorweisen
    static let wallet_onboarding_show_title = UBLocalized.tr("Localizable", "wallet_onboarding_show_title")
    /// Vorteile
    static let wallet_onboarding_store_header = UBLocalized.tr("Localizable", "wallet_onboarding_store_header")
    /// Covid-Zertifikate können einfach zur App hinzugefügt und digital aufbewahrt werden.
    static let wallet_onboarding_store_text1 = UBLocalized.tr("Localizable", "wallet_onboarding_store_text1")
    /// Die App prüft die Zertifikate auf ihre Gültigkeit in der Schweiz. So können Sie sich versichern, dass Ihre Zertifikate gültig sind.
    static let wallet_onboarding_store_text2 = UBLocalized.tr("Localizable", "wallet_onboarding_store_text2")
    /// Covid-Zertifikate digital aufbewahren
    static let wallet_onboarding_store_title = UBLocalized.tr("Localizable", "wallet_onboarding_store_title")
    /// Erneut scannen
    static let wallet_scan_again = UBLocalized.tr("Localizable", "wallet_scan_again")
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
    static let wallet_scanner_explanation = UBLocalized.tr("Localizable", "wallet_scanner_explanation")
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
    static let wallet_scanner_howitworks_answer1 = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_answer1")
    /// So funktioniert's
    static let wallet_scanner_howitworks_header = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_header")
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
    static let wallet_scanner_howitworks_question1 = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_question1")
    /// Um ein Covid-Zertifikat zur App hinzufügen zu können, benötigen Sie das Originalzertifikat auf Papier oder als PDF.
    static let wallet_scanner_howitworks_text1 = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_text1")
    /// Tippen Sie in der App auf «Hinzufügen», um ein neues Zertifikat zur App hinzuzufügen.
    static let wallet_scanner_howitworks_text2 = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_text2")
    /// Halten Sie nun die Kamera des Smartphones über den QR-Code auf dem Originalzertifikat, um den Code einzuscannen.
    static let wallet_scanner_howitworks_text3 = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_text3")
    /// Es erscheint eine Vorschau des Covid-Zertifikats. Tippen Sie auf «Hinzufügen» um das Zertifikat sicher in der App zu speichern.
    static let wallet_scanner_howitworks_text4 = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_text4")
    /// Covid-Zertifikate\nhinzufügen
    static let wallet_scanner_howitworks_title = UBLocalized.tr("Localizable", "wallet_scanner_howitworks_title")
    /// So funktioniert's
    static let wallet_scanner_info_button = UBLocalized.tr("Localizable", "wallet_scanner_info_button")
    /// Hinzufügen
    static let wallet_scanner_title = UBLocalized.tr("Localizable", "wallet_scanner_title")
    /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-app.html
    static let wallet_terms_privacy_link = UBLocalized.tr("Localizable", "wallet_terms_privacy_link")
}

// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension UBLocalized {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
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
