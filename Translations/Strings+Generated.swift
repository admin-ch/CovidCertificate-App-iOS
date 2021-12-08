// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
 enum UBLocalized {
   enum UBLocalizedKey : String {
    /// Zertifikat hinzufügen
     case accessibility_add_button_key = "accessibility_add_button"
    /// Schliessen
     case accessibility_close_button_key = "accessibility_close_button"
    /// erweitert
     case accessibility_expandable_box_expanded_state_key = "accessibility_expandable_box_expanded_state"
    /// reduziert
     case accessibility_expandable_box_reduced_state_key = "accessibility_expandable_box_reduced_state"
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
    /// QR-Code
     case accessibility_qr_code_key = "accessibility_qr_code"
    /// Aktualisieren
     case accessibility_refresh_button_key = "accessibility_refresh_button"
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
    /// Ausnahme Zertifikat
     case covid_certificate_ch_ausnahme_test_title_key = "covid_certificate_ch_ausnahme_test_title"
    /// Genesung
     case covid_certificate_recovery_title_key = "covid_certificate_recovery_title"
    /// Befund
     case covid_certificate_sero_positiv_test_befund_label_key = "covid_certificate_sero_positiv_test_befund_label"
    /// Genügend
     case covid_certificate_sero_positiv_test_befund_value_key = "covid_certificate_sero_positiv_test_befund_value"
    /// Genesung (Antikörper)
     case covid_certificate_sero_positiv_test_title_key = "covid_certificate_sero_positiv_test_title"
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
    /// Ein Speicher der App konnte nicht entschlüsselt werden. Um die App weiter zu benutzen muss der Speicher gelöscht und neu erstellt werden. Dabei gehen Daten verloren.
     case error_corrupt_sharedprefs_text_key = "error_corrupt_sharedprefs_text"
    /// Entschlüsselungsfehler
     case error_corrupt_sharedprefs_title_key = "error_corrupt_sharedprefs_title"
    /// Zurücksetzen
     case error_decryption_reset_button_key = "error_decryption_reset_button"
    /// Zertifikate konnten nicht geladen werden\n\nCode: {ERROR_CODE}
     case error_decryption_text_key = "error_decryption_text"
    /// Die Datei enthält entweder keinen gültigen QR-Code oder der QR-Code konnte nicht erkannt werden.
     case error_file_import_text_key = "error_file_import_text"
    /// Import fehlgeschlagen
     case error_file_import_title_key = "error_file_import_title"
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
    /// Aktualisieren
     case infobox_update_button_key = "infobox_update_button"
    /// Laden Sie die neue Version der App.
     case infobox_update_text_key = "infobox_update_text"
    /// Neue Version verfügbar
     case infobox_update_title_key = "infobox_update_title"
    /// Einstellungen
     case ios_settings_open_key = "ios_settings_open"
    /// de
     case language_key_key = "language_key"
    /// Sprache
     case language_title_key = "language_title"
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
     case NSCameraUsageDescription_key = "NSCameraUsageDescription"
    /// OK
     case ok_button_key = "ok_button"
    /// Kein gültiger Code
     case qr_scanner_error_key = "qr_scanner_error"
    /// Einstellungen
     case settings_title_key = "settings_title"
    /// Covid-19
     case target_disease_name_key = "target_disease_name"
    /// Ein unbekannter Fehler ist aufgetreten.
     case unknown_error_key = "unknown_error"
    /// Impftermin
     case vaccination_appointment_header_key = "vaccination_appointment_header"
    /// Aargau
     case vaccination_booking_ag_name_key = "vaccination_booking_ag_name"
    /// https://www.ag.ch/coronavirus-impfung
     case vaccination_booking_ag_url_key = "vaccination_booking_ag_url"
    /// Appenzell Innerrhoden
     case vaccination_booking_ai_name_key = "vaccination_booking_ai_name"
    /// https://www.ai.ch/coronavirus-impfung
     case vaccination_booking_ai_url_key = "vaccination_booking_ai_url"
    /// Appenzell Ausserrhoden
     case vaccination_booking_ar_name_key = "vaccination_booking_ar_name"
    /// https://www.ar.ch/verwaltung/departement-gesundheit-und-soziales/amt-fuer-gesundheit/informationsseite-coronavirus/coronaimpfung/
     case vaccination_booking_ar_url_key = "vaccination_booking_ar_url"
    /// Bern
     case vaccination_booking_be_name_key = "vaccination_booking_be_name"
    /// http://www.be.ch/corona-impfung
     case vaccination_booking_be_url_key = "vaccination_booking_be_url"
    /// Basel-Landschaft
     case vaccination_booking_bl_name_key = "vaccination_booking_bl_name"
    /// https://www.bl.ch/impfen
     case vaccination_booking_bl_url_key = "vaccination_booking_bl_url"
    /// Basel-Stadt
     case vaccination_booking_bs_name_key = "vaccination_booking_bs_name"
    /// http://www.coronaimpfzentrumbasel.ch
     case vaccination_booking_bs_url_key = "vaccination_booking_bs_url"
    /// Freiburg
     case vaccination_booking_fr_name_key = "vaccination_booking_fr_name"
    /// https://www.fr.ch/de/gesundheit/covid-19/covid-19-impfung-in-ihrer-naehe-durch-impfteams-in-den-impfzentren-in-der-apotheke-oder-bei-ihrem-arzt
     case vaccination_booking_fr_url_key = "vaccination_booking_fr_url"
    /// Genf
     case vaccination_booking_ge_name_key = "vaccination_booking_ge_name"
    /// https://www.ge.ch/se-faire-vacciner-contre-covid-19
     case vaccination_booking_ge_url_key = "vaccination_booking_ge_url"
    /// Glarus
     case vaccination_booking_gl_name_key = "vaccination_booking_gl_name"
    /// https://www.gl.ch/verwaltung/finanzen-und-gesundheit/gesundheit/coronavirus.html/4817#Impfung
     case vaccination_booking_gl_url_key = "vaccination_booking_gl_url"
    /// Graubünden
     case vaccination_booking_gr_name_key = "vaccination_booking_gr_name"
    /// https://www.gr.ch/DE/institutionen/verwaltung/djsg/ga/coronavirus/info/impfen/Seiten/impfen.aspx
     case vaccination_booking_gr_url_key = "vaccination_booking_gr_url"
    /// Die Covid-19-Impfung ist für Personen ab 12 Jahren empfohlen. Die Impfung ist gratis.
     case vaccination_booking_info_info_key = "vaccination_booking_info_info"
    /// Eine Impfung könnte zum Beispiel an diesen Orten in Ihrer Nähe stattfinden:\n\n- in spezifischen Impfzentren\n- in Spitälern\n- bei Ihrem Hausarzt oder Ihrer Hausärztin\n- in Impfapotheken\n\nViele Orte bieten auch Walk-in-Impfungen ohne Termine an.
     case vaccination_booking_info_text_key = "vaccination_booking_info_text"
    /// Impftermin in Ihrer Nähe buchen
     case vaccination_booking_info_title_key = "vaccination_booking_info_title"
    /// https://bag-coronavirus.ch/impfung/
     case vaccination_booking_info_url_key = "vaccination_booking_info_url"
    /// Jura
     case vaccination_booking_ju_name_key = "vaccination_booking_ju_name"
    /// https://www.jura.ch/fr/Autorites/Coronavirus/Vaccination.html
     case vaccination_booking_ju_url_key = "vaccination_booking_ju_url"
    /// Luzern
     case vaccination_booking_lu_name_key = "vaccination_booking_lu_name"
    /// http://www.lu.ch/covid_impfung
     case vaccination_booking_lu_url_key = "vaccination_booking_lu_url"
    /// Neuenburg
     case vaccination_booking_ne_name_key = "vaccination_booking_ne_name"
    /// https://www.ne.ch/autorites/DFS/SCSP/medecin-cantonal/maladies-vaccinations/covid-19-vaccination/Pages/accueil.aspx
     case vaccination_booking_ne_url_key = "vaccination_booking_ne_url"
    /// Nidwalden
     case vaccination_booking_nw_name_key = "vaccination_booking_nw_name"
    /// https://www.nw.ch/gesundheitsamtdienste/6044#Impfung
     case vaccination_booking_nw_url_key = "vaccination_booking_nw_url"
    /// Obwalden
     case vaccination_booking_ow_name_key = "vaccination_booking_ow_name"
    /// https://www.ow.ch/de/verwaltung/dienstleistungen/?dienst_id=5962#Impfung
     case vaccination_booking_ow_url_key = "vaccination_booking_ow_url"
    /// St. Gallen
     case vaccination_booking_sg_name_key = "vaccination_booking_sg_name"
    /// https://www.sg.ch/coronavirus/impfen
     case vaccination_booking_sg_url_key = "vaccination_booking_sg_url"
    /// Schaffhausen
     case vaccination_booking_sh_name_key = "vaccination_booking_sh_name"
    /// https://sh.ch/CMS/Webseite/Kanton-Schaffhausen/Beh-rde/Verwaltung/Departement-des-Innern/Gesundheitsamt-7126057-DE.html
     case vaccination_booking_sh_url_key = "vaccination_booking_sh_url"
    /// Solothurn
     case vaccination_booking_so_name_key = "vaccination_booking_so_name"
    /// https://so.ch/coronaimpfung
     case vaccination_booking_so_url_key = "vaccination_booking_so_url"
    /// Schwyz
     case vaccination_booking_sz_name_key = "vaccination_booking_sz_name"
    /// https://www.sz.ch/corona-impfen
     case vaccination_booking_sz_url_key = "vaccination_booking_sz_url"
    /// Thurgau
     case vaccination_booking_tg_name_key = "vaccination_booking_tg_name"
    /// https://gesundheit.tg.ch/aktuelles/impfung-fuer-covid-19.html/11590
     case vaccination_booking_tg_url_key = "vaccination_booking_tg_url"
    /// Tessin
     case vaccination_booking_ti_name_key = "vaccination_booking_ti_name"
    /// http://www.ti.ch/vaccinazione
     case vaccination_booking_ti_url_key = "vaccination_booking_ti_url"
    /// Uri
     case vaccination_booking_ur_name_key = "vaccination_booking_ur_name"
    /// https://www.ur.ch/themen/3673
     case vaccination_booking_ur_url_key = "vaccination_booking_ur_url"
    /// Waadt
     case vaccination_booking_vd_name_key = "vaccination_booking_vd_name"
    /// https://vd.ch/coronavirus-vaccins
     case vaccination_booking_vd_url_key = "vaccination_booking_vd_url"
    /// Wallis
     case vaccination_booking_vs_name_key = "vaccination_booking_vs_name"
    /// https://www.vs.ch/de/web/coronavirus#ancre_vaccination
     case vaccination_booking_vs_url_key = "vaccination_booking_vs_url"
    /// Zug
     case vaccination_booking_zg_name_key = "vaccination_booking_zg_name"
    /// https://www.corona-impfung-zug.ch/
     case vaccination_booking_zg_url_key = "vaccination_booking_zg_url"
    /// Zürich
     case vaccination_booking_zh_name_key = "vaccination_booking_zh_name"
    /// http://www.zh.ch/coronaimpfung
     case vaccination_booking_zh_url_key = "vaccination_booking_zh_url"
    /// Wählen Sie Ihren Kanton
     case vaccination_choose_your_canton_key = "vaccination_choose_your_canton"
    /// Mit der Covid-19-Impfung können Sie auf das wiederholte Testen verzichten.
     case vaccination_hint_text_1_key = "vaccination_hint_text_1"
    /// Mit der Covid-19-Impfung können Sie unbeschwert in die meisten Länder reisen.
     case vaccination_hint_text_2_key = "vaccination_hint_text_2"
    /// Mit der Covid-19-Impfung können Sie sich vor Erkrankung und einem allfälligen schweren Verlauf schützen.
     case vaccination_hint_text_3_key = "vaccination_hint_text_3"
    /// Mit der Covid-19-Impfung können Sie auf sichere Art immun werden.
     case vaccination_hint_text_4_key = "vaccination_hint_text_4"
    /// Mit der Covid-19-Impfung können Sie mithelfen, die Krankheitslast zu reduzieren.
     case vaccination_hint_text_5_key = "vaccination_hint_text_5"
    /// Mit der Covid-19-Impfung können Sie helfen, die Auswirkungen der Pandemie zu bekämpfen.
     case vaccination_hint_text_6_key = "vaccination_hint_text_6"
    /// Mit der Covid-19-Impfung können Sie die Langzeitfolgen einer Covid-19-Erkrankung vermeiden.
     case vaccination_hint_text_7_key = "vaccination_hint_text_7"
    /// Mit der Covid-19-Impfung können Sie dazu beitragen, das Gesundheitswesen zu entlasten.
     case vaccination_hint_text_8_key = "vaccination_hint_text_8"
    /// Mit der Covid-19-Impfung können Sie dazu beitragen, die Freiheiten des Alltags zurückzubringen.
     case vaccination_hint_text_9_key = "vaccination_hint_text_9"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_1_key = "vaccination_hint_title_1"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_2_key = "vaccination_hint_title_2"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_3_key = "vaccination_hint_title_3"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_4_key = "vaccination_hint_title_4"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_5_key = "vaccination_hint_title_5"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_6_key = "vaccination_hint_title_6"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_7_key = "vaccination_hint_title_7"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_8_key = "vaccination_hint_title_8"
    /// Jetzt impfen lassen!
     case vaccination_hint_title_9_key = "vaccination_hint_title_9"
    /// Impftermin buchen
     case vaccination_homescreen_button_title_key = "vaccination_homescreen_button_title"
    /// Zum Impf-Check
     case vaccination_impf_check_action_key = "vaccination_impf_check_action"
    /// Der Covid-19 Impf-Check gibt Auskunft über Erst- sowie Auffrischimpfungen und führt Sie zur entsprechenden Anlaufstelle in Ihrem Kanton.
     case vaccination_impf_check_info_text_key = "vaccination_impf_check_info_text"
    /// Jetzt Termin buchen
     case vaccination_impf_check_title_key = "vaccination_impf_check_title"
    /// https://covid19.impf-check.ch/
     case vaccination_impf_check_url_key = "vaccination_impf_check_url"
    /// Informationen zur Impfung
     case vaccination_information_button_in_certificate_key = "vaccination_information_button_in_certificate"
    /// Weitere Informationen rund um die Covid-19-Impfung
     case vaccination_more_information_title_key = "vaccination_more_information_title"
    /// market://details?id=ch.admin.bag.covidcertificate.verifier
     case verifier_android_app_google_play_store_url_key = "verifier_android_app_google_play_store_url"
    /// Covid Check
     case verifier_app_name_key = "verifier_app_name"
    /// COVID Certificate Check
     case verifier_app_title_key = "verifier_app_title"
    /// http://itunes.apple.com/app/id1565917510
     case verifier_apple_app_store_url_key = "verifier_apple_app_store_url"
    /// Gültigkeit des Zertifikats\nabgelaufen
     case verifier_certificate_light_error_expired_key = "verifier_certificate_light_error_expired"
    /// Für Betriebe und Veranstalter mit 2G-Regel. Es werden nur Zertifikate von Impfungen und Genesungen akzeptiert.
     case verifier_check_mode_info_2g_text_1_key = "verifier_check_mode_info_2g_text_1"
    /// Zertifikate von Covid-Tests werden als ungültig dargestellt.
     case verifier_check_mode_info_2g_text_2_key = "verifier_check_mode_info_2g_text_2"
    /// Light-Zertifikate können im 2G-Modus nicht geprüft werden.
     case verifier_check_mode_info_2g_text_3_key = "verifier_check_mode_info_2g_text_3"
    /// 2G
     case verifier_check_mode_info_2g_title_key = "verifier_check_mode_info_2g_title"
    /// Für Betriebe und Veranstalter mit 3G-Regel.
     case verifier_check_mode_info_3g_text_1_key = "verifier_check_mode_info_3g_text_1"
    /// Es werden gültige Zertifikate von Impfungen, Genesungen und Tests akzeptiert.
     case verifier_check_mode_info_3g_text_2_key = "verifier_check_mode_info_3g_text_2"
    /// Light-Zertifikate können geprüft werden.
     case verifier_check_mode_info_3g_text_3_key = "verifier_check_mode_info_3g_text_3"
    /// 3G
     case verifier_check_mode_info_3g_title_key = "verifier_check_mode_info_3g_title"
    /// Wählen Sie den Modus, in dem Sie Zertifikate prüfen müssen.
     case verifier_check_mode_info_unselected_text_1_key = "verifier_check_mode_info_unselected_text_1"
    /// Die Einstellungen können jederzeit geändert werden
     case verifier_check_mode_info_unselected_text_2_key = "verifier_check_mode_info_unselected_text_2"
    /// wählen
     case verifier_choose_mode_button_title_key = "verifier_choose_mode_button_title"
    /// Geburtsdatum
     case verifier_covid_certificate_birthdate_key = "verifier_covid_certificate_birthdate"
    /// Nachname
     case verifier_covid_certificate_name_key = "verifier_covid_certificate_name"
    /// Vorname
     case verifier_covid_certificate_prename_key = "verifier_covid_certificate_prename"
    /// Das Format des Covid-Zertifikats ist ungültig.
     case verifier_error_invalid_format_key = "verifier_error_invalid_format"
    /// Ihr gewählter Prüfmodus existiert nicht mehr.
     case verifier_error_mode_no_longer_exists_key = "verifier_error_mode_no_longer_exists"
    /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App mit der dafür vorgesehenen COVID Certificate Check App.
     case verifier_faq_works_answer_1_key = "verifier_faq_works_answer_1"
    /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
     case verifier_faq_works_answer_2_key = "verifier_faq_works_answer_2"
    /// Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
     case verifier_faq_works_answer_2_1_key = "verifier_faq_works_answer_2_1"
    /// Neben Pass oder ID werden auch andere Ausweisdokumente akzeptiert, die die Identität der betreffenden Person mit einem Foto belegen (z.B. Führerausweis). Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
     case verifier_faq_works_answer_3_key = "verifier_faq_works_answer_3"
    /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
     case verifier_faq_works_answer_4_key = "verifier_faq_works_answer_4"
    /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum der Zertifikatsinhaberin oder des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
     case verifier_faq_works_answer_5_key = "verifier_faq_works_answer_5"
    /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
     case verifier_faq_works_answer_6_key = "verifier_faq_works_answer_6"
    /// Grundsätzlich können Covid-Zertifikate auch ohne eine Internetverbindung geprüft werden. Dazu werden regelmässig aktualisierte Prüflisten von einem zentralen Server heruntergeladen. Diese lokal gespeicherten Prüflisten dürfen nicht älter als 48h sein. \n\nUm die Prüflisten zu aktualisieren muss die App mit dem Internet verbunden sein und geöffnet werden. Die Aktualisierung erfolgt unmittelbar und automatisch.
     case verifier_faq_works_answer_7_key = "verifier_faq_works_answer_7"
    /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
     case verifier_faq_works_answer_8_key = "verifier_faq_works_answer_8"
    /// Das Zertifikat Light kann durch die Halterin / den Halter jederzeit in der «COVID Certificate»-App deaktiviert werden. Danach steht das normale Covid-Zertifikat wieder zur Verfügung.
     case verifier_faq_works_answer_9_key = "verifier_faq_works_answer_9"
    /// Erklärvideo
     case verifier_faq_works_linktext_1_key = "verifier_faq_works_linktext_1"
    /// Weitere Informationen
     case verifier_faq_works_linktext_2_1_key = "verifier_faq_works_linktext_2_1"
    /// 
     case verifier_faq_works_linkurl_1_key = "verifier_faq_works_linkurl_1"
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/covid-zertifikat.html#-837133624
     case verifier_faq_works_linkurl_2_1_key = "verifier_faq_works_linkurl_2_1"
    /// Wie können Covid-Zertifikate geprüft werden?
     case verifier_faq_works_question_1_key = "verifier_faq_works_question_1"
    /// Was wird genau geprüft?
     case verifier_faq_works_question_2_key = "verifier_faq_works_question_2"
    /// Was sind die aktuellen Gültigkeitskriterien der Schweiz?
     case verifier_faq_works_question_2_1_key = "verifier_faq_works_question_2_1"
    /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
     case verifier_faq_works_question_3_key = "verifier_faq_works_question_3"
    /// Können auch ausländische Zertifikate geprüft werden?
     case verifier_faq_works_question_4_key = "verifier_faq_works_question_4"
    /// Welche Daten sehe ich beim Prüfvorgang?
     case verifier_faq_works_question_5_key = "verifier_faq_works_question_5"
    /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
     case verifier_faq_works_question_6_key = "verifier_faq_works_question_6"
    /// Können Zertifikate auch offline geprüft werden?
     case verifier_faq_works_question_7_key = "verifier_faq_works_question_7"
    /// Was ist das Zertifikat Light?
     case verifier_faq_works_question_8_key = "verifier_faq_works_question_8"
    /// Wie kann ein Zertifikat Light wieder in ein EU/EFTA-konformes Covid-Zertifikat umgewandelt werden?
     case verifier_faq_works_question_9_key = "verifier_faq_works_question_9"
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
    /// Prüfen ({MODE})
     case verifier_homescreen_scan_button_with_mode_key = "verifier_homescreen_scan_button_with_mode"
    /// So funktioniert's
     case verifier_homescreen_support_button_key = "verifier_homescreen_support_button"
    /// Check
     case verifier_homescreen_title_key = "verifier_homescreen_title"
    /// Prüfmodus
     case verifier_mode_title_key = "verifier_mode_title"
    /// Ein unerwarteter Fehler ist aufgetreten.
     case verifier_network_error_text_key = "verifier_network_error_text"
    /// Prüfung fehlgeschlagen
     case verifier_network_error_title_key = "verifier_network_error_title"
    /// Eine Internetverbindung wird benötigt, um die Prüflisten zu aktualisieren
     case verifier_offline_error_text_key = "verifier_offline_error_text"
    /// Offline-Prüfung nicht möglich
     case verifier_offline_error_title_key = "verifier_offline_error_title"
    /// Externer Hardwarescanner erkannt
     case verifier_qr_scanner_external_hardware_detected_key = "verifier_qr_scanner_external_hardware_detected"
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
    /// Mit diesem Update können Sie in der App auch die Zertifikatskopie ohne Gesundheitsdaten prüfen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
     case verifier_update_boarding_certificate_light_text_key = "verifier_update_boarding_certificate_light_text"
    /// Zertifikat Light
     case verifier_update_boarding_certificate_light_title_key = "verifier_update_boarding_certificate_light_title"
    /// Update
     case verifier_update_boarding_header_key = "verifier_update_boarding_header"
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDie Gültigkeit des Zertifikat ist abgelaufen.
     case verifier_verifiy_error_expired_key = "verifier_verifiy_error_expired"
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDas Zertifikat ist noch nicht gültig.
     case verifier_verifiy_error_notyetvalid_key = "verifier_verifiy_error_notyetvalid"
    /// Das Covid-Zertifikat wurde widerrufen
     case verifier_verify_error_info_for_blacklist_key = "verifier_verify_error_info_for_blacklist"
    /// Das Covid-Zertifikat hat keine gültige Signatur
     case verifier_verify_error_info_for_certificate_invalid_key = "verifier_verify_error_info_for_certificate_invalid"
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz oder des Prüfmodus ({MODUS})
     case verifier_verify_error_info_for_national_rules_key = "verifier_verify_error_info_for_national_rules"
    /// Ein unerwarteter Fehler ist aufgetreten.
     case verifier_verify_error_list_info_text_key = "verifier_verify_error_list_info_text"
    /// Prüfung fehlgeschlagen
     case verifier_verify_error_list_title_key = "verifier_verify_error_list_title"
    /// Covid-Zertifikat ungültig
     case verifier_verify_error_title_key = "verifier_verify_error_title"
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz.
     case verifier_verify_error_validity_range_bold_key = "verifier_verify_error_validity_range_bold"
    /// Die Prüfung kann in diesem Fall nur erfolgen, wenn die Umwandlung in ein Zertifikat Light rückgängig gemacht wird.
     case verifier_verify_light_not_supported_by_mode_text_key = "verifier_verify_light_not_supported_by_mode_text"
    /// Beim zu prüfenden Covid-Zertifikat handelt es sich um ein Zertifikat Light. Dies kann im {MODUS}-Prüfmodus nicht geprüft werden.
     case verifier_verify_light_not_supported_by_mode_title_key = "verifier_verify_light_not_supported_by_mode_title"
    /// Zertifikat wird geprüft
     case verifier_verify_loading_text_key = "verifier_verify_loading_text"
    /// Nur mit einem Ausweisdokument \n& innerhalb der Schweiz gültig
     case verifier_verify_success_certificate_light_info_key = "verifier_verify_success_certificate_light_info"
    /// Nur mit einem \nAusweisdokument gültig
     case verifier_verify_success_info_key = "verifier_verify_success_info"
    /// Nicht widerrufen
     case verifier_verify_success_info_for_blacklist_key = "verifier_verify_success_info_for_blacklist"
    /// Signatur gültig
     case verifier_verify_success_info_for_certificate_valid_key = "verifier_verify_success_info_for_certificate_valid"
    /// Prüfung erfolgreich
     case verifier_verify_success_title_key = "verifier_verify_success_title"
    /// Noch {TIMESPAN} gültig
     case wallet_accessibility_light_certificate_expiration_timer_key = "wallet_accessibility_light_certificate_expiration_timer"
    /// Hinzufügen
     case wallet_add_certificate_key = "wallet_add_certificate"
    /// Hinzufügen
     case wallet_add_certificate_button_key = "wallet_add_certificate_button"
    /// market://details?id=ch.admin.bag.covidcertificate.wallet
     case wallet_android_app_google_play_store_url_key = "wallet_android_app_google_play_store_url"
    /// Covid Cert
     case wallet_app_name_key = "wallet_app_name"
    /// http://itunes.apple.com/app/id1565917320
     case wallet_apple_app_store_url_key = "wallet_apple_app_store_url"
    /// Covid-Zertifikat
     case wallet_certificate_key = "wallet_certificate"
    /// Dieses Zertifikat ist bereits in der App gespeichert
     case wallet_certificate_already_exists_key = "wallet_certificate_already_exists"
    /// Verantwortliche Stelle für Ausstellung
     case wallet_certificate_ausnahme_responsible_issuer_key = "wallet_certificate_ausnahme_responsible_issuer"
    /// Startdatum des Attests
     case wallet_certificate_ausnahme_test_attest_start_date_key = "wallet_certificate_ausnahme_test_attest_start_date"
    /// Zertifikat erstellt am\n{DATE}
     case wallet_certificate_date_key = "wallet_certificate_date"
    /// Wollen Sie das Zertifikat wirklich löschen?
     case wallet_certificate_delete_confirm_text_key = "wallet_certificate_delete_confirm_text"
    /// Zertifikat Light
     case wallet_certificate_detail_certificate_light_button_key = "wallet_certificate_detail_certificate_light_button"
    /// Date format used: dd.mm.yyyy
     case wallet_certificate_detail_date_format_info_key = "wallet_certificate_detail_date_format_info"
    /// Exportieren
     case wallet_certificate_detail_export_button_key = "wallet_certificate_detail_export_button"
    /// Dieses Zertifikat ist kein Reisedokument. \n\nDie wissenschaftlichen Erkenntnisse über Covid-19-Impfungen und -Tests sowie über die Genesung von einer Covid-19-Infektion entwickeln sich ständig weiter, auch im Hinblick auf neue besorgniserregende Virusvarianten. \n\nBitte informieren Sie sich vor der Reise über die am Zielort geltenden Gesundheitsmassnahmen und damit verbundenen Beschränkungen.
     case wallet_certificate_detail_note_key = "wallet_certificate_detail_note"
    /// Nachweis erstellt am\n{DATE}
     case wallet_certificate_evidence_creation_date_key = "wallet_certificate_evidence_creation_date"
    /// Nachweis
     case wallet_certificate_evidence_title_key = "wallet_certificate_evidence_title"
    /// Exportieren
     case wallet_certificate_export_button_key = "wallet_certificate_export_button"
    /// PDF konnte nicht\nerstellt werden
     case wallet_certificate_export_detail_error_title_key = "wallet_certificate_export_detail_error_title"
    /// Exportieren
     case wallet_certificate_export_detail_export_button_key = "wallet_certificate_export_detail_export_button"
    /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
     case wallet_certificate_export_detail_general_error_text_key = "wallet_certificate_export_detail_general_error_text"
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_certificate_export_detail_general_error_title_key = "wallet_certificate_export_detail_general_error_title"
    /// Um das PDF erstellen zu können, muss die App online sein.
     case wallet_certificate_export_detail_network_error_text_key = "wallet_certificate_export_detail_network_error_text"
    /// Keine Verbindung zum Internet
     case wallet_certificate_export_detail_network_error_title_key = "wallet_certificate_export_detail_network_error_title"
    /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
     case wallet_certificate_export_detail_summary_1_key = "wallet_certificate_export_detail_summary_1"
    /// Die Erstellung des PDF-Dokuments erfolgt online.
     case wallet_certificate_export_detail_summary_2_key = "wallet_certificate_export_detail_summary_2"
    /// Exportieren
     case wallet_certificate_export_detail_title_key = "wallet_certificate_export_detail_title"
    /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
     case wallet_certificate_export_summary_1_key = "wallet_certificate_export_summary_1"
    /// Die Erstellung des PDF-Dokuments erfolgt online.
     case wallet_certificate_export_summary_2_key = "wallet_certificate_export_summary_2"
    /// Covid-Zertifikat exportieren
     case wallet_certificate_export_title_key = "wallet_certificate_export_title"
    /// UVCI
     case wallet_certificate_identifier_key = "wallet_certificate_identifier"
    /// Impfdosis
     case wallet_certificate_impfdosis_title_key = "wallet_certificate_impfdosis_title"
    /// Hersteller
     case wallet_certificate_impfstoff_holder_key = "wallet_certificate_impfstoff_holder"
    /// Produkt
     case wallet_certificate_impfstoff_product_name_title_key = "wallet_certificate_impfstoff_product_name_title"
    /// Aktivieren
     case wallet_certificate_light_detail_activate_button_key = "wallet_certificate_light_detail_activate_button"
    /// Zertifikat Light\nkonnte nicht aktiviert werden
     case wallet_certificate_light_detail_activation_error_key = "wallet_certificate_light_detail_activation_error"
    /// Versuchen Sie es später erneut.
     case wallet_certificate_light_detail_activation_general_error_text_key = "wallet_certificate_light_detail_activation_general_error_text"
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_certificate_light_detail_activation_general_error_title_key = "wallet_certificate_light_detail_activation_general_error_title"
    /// Um das Zertifikat Light aktivieren zu können, muss die App online sein.
     case wallet_certificate_light_detail_activation_network_error_text_key = "wallet_certificate_light_detail_activation_network_error_text"
    /// Keine Verbindung zum Internet
     case wallet_certificate_light_detail_activation_network_error_title_key = "wallet_certificate_light_detail_activation_network_error_title"
    /// Deaktivieren
     case wallet_certificate_light_detail_deactivate_button_key = "wallet_certificate_light_detail_deactivate_button"
    /// Kann nur innerhalb der Schweiz verwendet werden
     case wallet_certificate_light_detail_summary_1_key = "wallet_certificate_light_detail_summary_1"
    /// Enthält nur Namen, Vornamen, Geburtsdatum und eine elektronische Signatur
     case wallet_certificate_light_detail_summary_2_key = "wallet_certificate_light_detail_summary_2"
    /// Gültig für max. 24 Stunden
     case wallet_certificate_light_detail_summary_3_key = "wallet_certificate_light_detail_summary_3"
    /// Die Konvertierung des Covid-Zertifikats in ein Zertifikat Light erfolgt online.
     case wallet_certificate_light_detail_summary_4_key = "wallet_certificate_light_detail_summary_4"
    /// Sie können das Zertifikat Light jederzeit deaktivieren, um wieder zum normalen Covid-Zertifikat zu wechseln.
     case wallet_certificate_light_detail_summary_5_key = "wallet_certificate_light_detail_summary_5"
    /// Zertifikat Light
     case wallet_certificate_light_detail_summary_title_key = "wallet_certificate_light_detail_summary_title"
    /// Wenn Sie das Zertifikat Light aktivieren, wird aus den Daten Ihres Covid-Zertifikats ein neuer QR-Code erstellt, der keine Gesundheitsdaten enthält.
     case wallet_certificate_light_detail_text_1_key = "wallet_certificate_light_detail_text_1"
    /// Während das normale Covid-Zertifikat im Rahmen seiner Gültigkeit ohne Einschränkungen sowohl in der Schweiz als auch in der EU/EFTA verwendet werden kann, ist der Einsatz des Zertifikats Light nur in der Schweiz möglich. Aus Datenschutzgründen muss das Zertifikat Light nach 24 Stunden erneut aktiviert werden. Es bringt keine zusätzlichen Rechte gegenüber dem normalen Covid-Zertifikat.
     case wallet_certificate_light_detail_text_2_key = "wallet_certificate_light_detail_text_2"
    /// nur muss keine
     case wallet_certificate_light_detail_text_2_bold_key = "wallet_certificate_light_detail_text_2_bold"
    /// Was ist ein \nZertifikat Light?
     case wallet_certificate_light_detail_title_key = "wallet_certificate_light_detail_title"
    /// Das Zertifikat Light wurde in den letzten 24h bereits zu oft aktiviert.
     case wallet_certificate_light_rate_limit_text_key = "wallet_certificate_light_rate_limit_text"
    /// 24h-Limite erreicht
     case wallet_certificate_light_rate_limit_title_key = "wallet_certificate_light_rate_limit_title"
    /// Zertifikat Light
     case wallet_certificate_light_title_key = "wallet_certificate_light_title"
    /// Light
     case wallet_certificate_list_light_certificate_badge_key = "wallet_certificate_list_light_certificate_badge"
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
    /// Hersteller und Name
     case wallet_certificate_test_holder_and_name_key = "wallet_certificate_test_holder_and_name"
    /// Land des Tests
     case wallet_certificate_test_land_key = "wallet_certificate_test_land"
    /// Name
     case wallet_certificate_test_name_key = "wallet_certificate_test_name"
    /// Datum Resultat
     case wallet_certificate_test_result_date_title_key = "wallet_certificate_test_result_date_title"
    /// Nicht erkannt (Negativ)
     case wallet_certificate_test_result_negativ_key = "wallet_certificate_test_result_negativ"
    /// Erkannt (Positiv)
     case wallet_certificate_test_result_positiv_key = "wallet_certificate_test_result_positiv"
    /// Ergebnis
     case wallet_certificate_test_result_title_key = "wallet_certificate_test_result_title"
    /// Datum der Probenentnahme
     case wallet_certificate_test_sample_date_title_key = "wallet_certificate_test_sample_date_title"
    /// Typ
     case wallet_certificate_test_type_key = "wallet_certificate_test_type"
    /// Unvollständige Impfung
     case wallet_certificate_type_incomplete_vaccine_key = "wallet_certificate_type_incomplete_vaccine"
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
    /// Hier könnte ein Text stehen, der erklärt was 2G bedeutet und dass der Zertifikatstyp für 2G NICHT ok ist.
     case wallet_check_mode_info_2g_not_ok_text_key = "wallet_check_mode_info_2g_not_ok_text"
    /// Hier könnte ein Text stehen, der erklärt was 2G bedeutet und dass der Zertifikatstyp für 2G ok ist.
     case wallet_check_mode_info_2g_ok_text_key = "wallet_check_mode_info_2g_ok_text"
    /// Hier könnte ein Text stehen, der erklärt was 3G bedeutet und dass der Zertifikatstyp für 3G NICHT ok ist.
     case wallet_check_mode_info_3g_not_ok_text_key = "wallet_check_mode_info_3g_not_ok_text"
    /// Hier könnte ein Text stehen, der erklärt was 3G bedeutet und dass der Zertifikatstyp für 3G ok ist.
     case wallet_check_mode_info_3g_ok_text_key = "wallet_check_mode_info_3g_ok_text"
    /// Infos
     case wallet_check_mode_info_title_key = "wallet_check_mode_info_title"
    /// Versuchen Sie es später erneut.
     case wallet_detail_network_error_text_key = "wallet_detail_network_error_text"
    /// Prüfung zur Zeit nicht möglich
     case wallet_detail_network_error_title_key = "wallet_detail_network_error_title"
    /// Prüfung offline nicht möglich
     case wallet_detail_offline_retry_title_key = "wallet_detail_offline_retry_title"
    /// Gültigkeit des Zertifikats\nabgelaufen
     case wallet_error_expired_key = "wallet_error_expired"
    /// abgelaufen
     case wallet_error_expired_bold_key = "wallet_error_expired_bold"
    /// Format des Zertifikat\nungültig
     case wallet_error_invalid_format_key = "wallet_error_invalid_format"
    /// ungültig
     case wallet_error_invalid_format_bold_key = "wallet_error_invalid_format_bold"
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
    /// Von Covid-19 genesene Personen können das Covid-Zertifikat über ein Online-Formular auf der Webseite des Kantons beantragen. Das Covid-Zertifikat wird anschliessend per Post zugeschickt.
     case wallet_faq_questions_answer_1_1_key = "wallet_faq_questions_answer_1_1"
    /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass Sie in jedem Fall auf Verlangen auch noch ein Ausweisdokument vorweisen müssen.
     case wallet_faq_questions_answer_2_key = "wallet_faq_questions_answer_2"
    /// Die Gültigkeitsdauer unterscheidet sich je nachdem, ob Sie eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis haben. Aufgrund neuer wissenschaftlicher Erkenntnisse kann sich die Gültigkeitsdauer verändern. Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
     case wallet_faq_questions_answer_2_1_key = "wallet_faq_questions_answer_2_1"
    /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
     case wallet_faq_questions_answer_3_key = "wallet_faq_questions_answer_3"
    /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument gültig.
     case wallet_faq_questions_answer_4_key = "wallet_faq_questions_answer_4"
    /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier deshalb sorgfältig auf. Bei Verlust müssen Sie das Covid-Zertifikat erneut bei der ausgebenden Stelle anfragen.
     case wallet_faq_questions_answer_5_key = "wallet_faq_questions_answer_5"
    /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
     case wallet_faq_questions_answer_6_key = "wallet_faq_questions_answer_6"
    /// Weitere Informationen
     case wallet_faq_questions_linktext_2_1_key = "wallet_faq_questions_linktext_2_1"
    /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/#contents2
     case wallet_faq_questions_linkurl_2_1_key = "wallet_faq_questions_linkurl_2_1"
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
     case wallet_faq_questions_question_1_key = "wallet_faq_questions_question_1"
    /// Wie erhalte ich nach einer durchgemachten Covid-19-Erkrankung ein Covid-Zertifikat?
     case wallet_faq_questions_question_1_1_key = "wallet_faq_questions_question_1_1"
    /// Wie kann ich ein Covid-Zertifikat vorweisen?
     case wallet_faq_questions_question_2_key = "wallet_faq_questions_question_2"
    /// Wie lange ist das Covid-Zertifikat gültig?
     case wallet_faq_questions_question_2_1_key = "wallet_faq_questions_question_2_1"
    /// Wo sind meine Daten gespeichert?
     case wallet_faq_questions_question_3_key = "wallet_faq_questions_question_3"
    /// Wie werden Missbrauch und Fälschung verhindert?
     case wallet_faq_questions_question_4_key = "wallet_faq_questions_question_4"
    /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
     case wallet_faq_questions_question_5_key = "wallet_faq_questions_question_5"
    /// Was ist das Zertifikat Light?
     case wallet_faq_questions_question_6_key = "wallet_faq_questions_question_6"
    /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
     case wallet_faq_questions_subtitle_key = "wallet_faq_questions_subtitle"
    /// Was sind Covid-Zertifikate?
     case wallet_faq_questions_title_key = "wallet_faq_questions_title"
    /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
     case wallet_faq_works_answer_1_key = "wallet_faq_works_answer_1"
    /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument des Zertifikatsinhabers / der Zertifikatsinhaberin gültig.
     case wallet_faq_works_answer_2_key = "wallet_faq_works_answer_2"
    /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
     case wallet_faq_works_answer_2_1_key = "wallet_faq_works_answer_2_1"
    /// In der COVID Certificate App wird ausgewiesen, wann Ihr Covid-Zertifikat in der Schweiz ablaufen wird. Sie können in der Detail-Ansicht zudem per Knopfdruck überprüfen, ob Ihr Covid-Zertifikat aktuell gültig ist.
     case wallet_faq_works_answer_3_key = "wallet_faq_works_answer_3"
    /// Sie können die App ohne eine Internetverbindung verwenden. Auch im Offline-Modus können Zertifikate vorgewiesen und von den Prüfern gescannt und verifiziert werden.\n\nUm in der «COVID Certificate»-App anzeigen zu können, ob ihr Zertifikat den Gültigkeitskriterien der Schweiz entspricht und bis wann Ihr Zertifikat gültig ist, muss die App jedoch regelmässig online sein.
     case wallet_faq_works_answer_3_1_key = "wallet_faq_works_answer_3_1"
    /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
     case wallet_faq_works_answer_4_key = "wallet_faq_works_answer_4"
    /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
     case wallet_faq_works_answer_5_key = "wallet_faq_works_answer_5"
    /// In der «COVID Certificate»-App finden Sie in der Detailansicht des elektronische Covid-Zertifikats die Funktion «Exportieren». Damit können Sie ein PDF erstellen, dieses speichern und ausdrucken.
     case wallet_faq_works_answer_5_1_key = "wallet_faq_works_answer_5_1"
    /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihrem Mobilgerät speichern. Laden Sie dazu die App erneut herunter und scannen Sie anschliessend den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
     case wallet_faq_works_answer_6_key = "wallet_faq_works_answer_6"
    /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
     case wallet_faq_works_question_1_key = "wallet_faq_works_question_1"
    /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
     case wallet_faq_works_question_2_key = "wallet_faq_works_question_2"
    /// Was ist ein Transfer-Code?
     case wallet_faq_works_question_2_1_key = "wallet_faq_works_question_2_1"
    /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
     case wallet_faq_works_question_3_key = "wallet_faq_works_question_3"
    /// Kann ich die App auch offline verwenden?
     case wallet_faq_works_question_3_1_key = "wallet_faq_works_question_3_1"
    /// Wie sind meine Daten geschützt?
     case wallet_faq_works_question_4_key = "wallet_faq_works_question_4"
    /// Welche Daten sind im QR-Code enthalten?
     case wallet_faq_works_question_5_key = "wallet_faq_works_question_5"
    /// Ich habe das Covid-Zertifikat ausschliesslich elektronisch in der App. Wie komme ich zum Zertifikat als PDF oder auf Papier?
     case wallet_faq_works_question_5_1_key = "wallet_faq_works_question_5_1"
    /// Was muss ich tun, wenn ich das Covid-Zertifikat oder die App lösche?
     case wallet_faq_works_question_6_key = "wallet_faq_works_question_6"
    /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
     case wallet_faq_works_subtitle_key = "wallet_faq_works_subtitle"
    /// Wie funktioniert \ndie App?
     case wallet_faq_works_title_key = "wallet_faq_works_title"
    /// Sie haben ein Covid-Zertifikat auf Papier oder als PDF und möchten es zur App hinzufügen.
     case wallet_homescreen_add_certificate_description_key = "wallet_homescreen_add_certificate_description"
    /// Zertifikat hinzufügen
     case wallet_homescreen_add_title_key = "wallet_homescreen_add_title"
    /// Transfer-Code erstellen
     case wallet_homescreen_add_transfer_code_key = "wallet_homescreen_add_transfer_code"
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
     case wallet_homescreen_explanation_key = "wallet_homescreen_explanation"
    /// Gültigkeit konnte nicht ermittelt werden
     case wallet_homescreen_network_error_key = "wallet_homescreen_network_error"
    /// Offline Modus
     case wallet_homescreen_offline_key = "wallet_homescreen_offline"
    /// PDF importieren
     case wallet_homescreen_pdf_import_key = "wallet_homescreen_pdf_import"
    /// QR-Code scannen
     case wallet_homescreen_qr_code_scannen_key = "wallet_homescreen_qr_code_scannen"
    /// Nächsten Schritt wählen
     case wallet_homescreen_what_to_do_key = "wallet_homescreen_what_to_do"
    /// Zur Check-App
     case wallet_info_box_certificate_scan_button_check_app_key = "wallet_info_box_certificate_scan_button_check_app"
    /// Verstanden
     case wallet_info_box_certificate_scan_close_key = "wallet_info_box_certificate_scan_close"
    /// Für eine Datenschutzkonforme und schnellere Prüfung nutzen Sie die "COVID Certificate Check"-App.
     case wallet_info_box_certificate_scan_text_key = "wallet_info_box_certificate_scan_text"
    /// «COVID Certificate Check»-App.
     case wallet_info_box_certificate_scan_text_bold_key = "wallet_info_box_certificate_scan_text_bold"
    /// Wollen Sie Zertifikate überprüfen?
     case wallet_info_box_certificate_scan_title_key = "wallet_info_box_certificate_scan_title"
    /// Aktivieren
     case wallet_notification_disabled_button_key = "wallet_notification_disabled_button"
    /// Tipp: Mitteilungen aktivieren
     case wallet_notification_disabled_titel_key = "wallet_notification_disabled_titel"
    /// Weiter
     case wallet_notification_permission_button_key = "wallet_notification_permission_button"
    /// Die App kann Sie informieren, sobald das Zertifikat eingetroffen ist.  Erlauben Sie dazu der App, Ihnen Mitteilungen zu senden.
     case wallet_notification_permission_text_key = "wallet_notification_permission_text"
    /// Mitteilungen erlauben
     case wallet_notification_permission_title_key = "wallet_notification_permission_title"
    /// Das Covid-Zertifikat ist eingetroffen
     case wallet_notification_transfer_text_key = "wallet_notification_transfer_text"
    /// Transfer erfolgreich
     case wallet_notification_transfer_title_key = "wallet_notification_transfer_title"
    /// Um die aktuelle Gültigkeit anzeigen zu können, muss die App regelmässig online sein.
     case wallet_offline_description_key = "wallet_offline_description"
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
    /// Nur mit einem Ausweisdokument \n& innerhalb der Schweiz gültig
     case wallet_only_valid_in_switzerland_key = "wallet_only_valid_in_switzerland"
    /// Erneut scannen
     case wallet_scan_again_key = "wallet_scan_again"
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
     case wallet_scanner_explanation_key = "wallet_scanner_explanation"
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
     case wallet_scanner_howitworks_answer1_key = "wallet_scanner_howitworks_answer1"
    /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
     case wallet_scanner_howitworks_external_link_key = "wallet_scanner_howitworks_external_link"
    /// Weitere Informationen
     case wallet_scanner_howitworks_external_link_title_key = "wallet_scanner_howitworks_external_link_title"
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
    /// Datum, Uhrzeit oder Zeitzone auf dem Gerät sind falsch eingestellt.
     case wallet_time_inconsistency_error_text_key = "wallet_time_inconsistency_error_text"
    /// Prüfung nicht möglich
     case wallet_time_inconsistency_error_title_key = "wallet_time_inconsistency_error_title"
    /// Transfer
     case wallet_transfer_code_card_title_key = "wallet_transfer_code_card_title"
    /// Ihr Transfer-Code wurde erstellt
     case wallet_transfer_code_code_created_title_key = "wallet_transfer_code_code_created_title"
    /// Transfer Code kopiert
     case wallet_transfer_code_copied_key = "wallet_transfer_code_copied"
    /// Code erstellen
     case wallet_transfer_code_create_code_button_key = "wallet_transfer_code_create_code_button"
    /// Erstellt am {DATE}
     case wallet_transfer_code_createdat_key = "wallet_transfer_code_createdat"
    /// Fertig
     case wallet_transfer_code_done_button_key = "wallet_transfer_code_done_button"
    /// Transfer-Code konnte nicht erstellt werden
     case wallet_transfer_code_error_title_key = "wallet_transfer_code_error_title"
    /// Noch {DAYS} Tage gültig
     case wallet_transfer_code_expire_plural_key = "wallet_transfer_code_expire_plural"
    /// {DAYS} Tage
     case wallet_transfer_code_expire_plural_bold_key = "wallet_transfer_code_expire_plural_bold"
    /// Noch 1 Tag gültig
     case wallet_transfer_code_expire_singular_key = "wallet_transfer_code_expire_singular"
    /// 1 Tag
     case wallet_transfer_code_expire_singular_bold_key = "wallet_transfer_code_expire_singular_bold"
    /// Wenn Sie einen Covid-Test machen (PCR-Test oder Antigen-Schnelltest), kann der Transfer-Code zur schnellen Übermittlung von Covid-Zertifikaten zum Einsatz kommen.\n\nInformieren Sie sich bei Ihrem Testcenter, in der Apotheke oder bei Ihrem Arzt, ob die Übermittlung per Transfer-Code angeboten wird.
     case wallet_transfer_code_faq_questions_answer_1_key = "wallet_transfer_code_faq_questions_answer_1"
    /// Aktuell ist die Übermittlung per Transfer-Code auf Covid-Tests ausgelegt. Wie Sie ein Covid-Zertifikat nach einer Impfung erhalten erfahren Sie hier:
     case wallet_transfer_code_faq_questions_answer_2_key = "wallet_transfer_code_faq_questions_answer_2"
    /// Falls die Stelle, die den Covid-Test durchführt, die Übermittlung per Transfer-Code anbietet, werden Sie bereits bei der Anmeldung oder der Testentnahme nach einem Transfer-Code gefragt.\n\nDen Transfer-Code können Sie in der «COVID Certificate»-App erstellen. Tippen Sie dazu auf dem Startbildschirm auf «Hinzufügen» resp. auf das «Plus»-Symbol unten rechts. Danach tippen Sie auf «Transfer-Code erstellen».\n\nDie App zeigt Ihnen einen 9-stelligen Code an. Diesen können Sie entweder bei der Anmeldung in ein Formular eintragen oder direkt bei der Testentnahme angeben.
     case wallet_transfer_code_faq_questions_answer_3_key = "wallet_transfer_code_faq_questions_answer_3"
    /// Nein, ein Transfer-Code kann nur einmal verwendet werden. Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie bitte für jedes Zertifikat einen neuen Code.
     case wallet_transfer_code_faq_questions_answer_4_key = "wallet_transfer_code_faq_questions_answer_4"
    /// Weitere Informationen
     case wallet_transfer_code_faq_questions_linktext_2_key = "wallet_transfer_code_faq_questions_linktext_2"
    /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
     case wallet_transfer_code_faq_questions_linkurl_2_key = "wallet_transfer_code_faq_questions_linkurl_2"
    /// Wer bietet die Übermittlung per Transfer-Code an?
     case wallet_transfer_code_faq_questions_question_1_key = "wallet_transfer_code_faq_questions_question_1"
    /// Können Transfer-Codes auch zur Übermittlung von Impfzertifikaten verwendet werden?
     case wallet_transfer_code_faq_questions_question_2_key = "wallet_transfer_code_faq_questions_question_2"
    /// Wie funktioniert die Übermittlung per Transfer-Code?
     case wallet_transfer_code_faq_questions_question_3_key = "wallet_transfer_code_faq_questions_question_3"
    /// Kann ich den Transfer-Code mehrmals benutzen?
     case wallet_transfer_code_faq_questions_question_4_key = "wallet_transfer_code_faq_questions_question_4"
    /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
     case wallet_transfer_code_faq_questions_subtitle_key = "wallet_transfer_code_faq_questions_subtitle"
    /// Covid-Zertifikate direkt in die App geliefert
     case wallet_transfer_code_faq_questions_title_key = "wallet_transfer_code_faq_questions_title"
    /// Für den Transfer wird Ihr Covid-Zertifikat verschlüsselt bereitgestellt. Der Transfer-Code stellt sicher, dass nur Ihre App das Covid-Zertifikat empfangen kann. Unmittelbar nach dem Transfer werden die Daten wieder vom Server gelöscht.
     case wallet_transfer_code_faq_works_answer_1_key = "wallet_transfer_code_faq_works_answer_1"
    /// Sobald das Zertifikat vom Labor oder Testcenter generiert wurde, steht es zum Transfer zur Verfügung. Stellen Sie sicher, dass Ihr Smartphone mit dem Internet verbunden ist, um Zertifikate empfangen zu können.\n\nSollte ihr Covid-Zertifikat dennoch nicht eintreffen, fragen Sie bei der Stelle nach, die den Test durchgeführt hat (Testcenter, Apotheke, Ärztin / Arzt).
     case wallet_transfer_code_faq_works_answer_2_key = "wallet_transfer_code_faq_works_answer_2"
    /// Bei einem positiven Antigen-Schnelltest erhalten Sie vom Labor kein Covid-Zertifikat. \n\nBei einem positiven PCR-Test erhalten Sie ein Covid-Zertifikat für Genesene. Es ist ab dem 11. Tag nach der Testentnahme gültig.
     case wallet_transfer_code_faq_works_answer_3_key = "wallet_transfer_code_faq_works_answer_3"
    /// Die App prüft regelmässig, ob ein Covid-Zertifikat für Ihren Transfer-Code verfügbar ist.
     case wallet_transfer_code_faq_works_intro_1_key = "wallet_transfer_code_faq_works_intro_1"
    /// Sobald das Covid-Zertifikat verfügbar ist, erscheint es in der App. Wenn Sie Mitteilungen aktiviert haben, werden Sie von der App benachrichtigt.
     case wallet_transfer_code_faq_works_intro_2_key = "wallet_transfer_code_faq_works_intro_2"
    /// Nach {TRANSFER_CODE_VALIDITY} Tagen läuft der Transfer-Code ab. Danach wartet die App noch für weitere 72h auf einen möglichen Transfer, bevor der Transfer-Code ungültig wird.
     case wallet_transfer_code_faq_works_intro_3_key = "wallet_transfer_code_faq_works_intro_3"
    /// Wie sind meine Daten beim Transfer geschützt?
     case wallet_transfer_code_faq_works_question_1_key = "wallet_transfer_code_faq_works_question_1"
    /// Was kann ich tun, wenn das Zertifikat nicht ankommt?
     case wallet_transfer_code_faq_works_question_2_key = "wallet_transfer_code_faq_works_question_2"
    /// Was passiert bei einem positiven Testresultat?
     case wallet_transfer_code_faq_works_question_3_key = "wallet_transfer_code_faq_works_question_3"
    /// So funktioniert der Transfer
     case wallet_transfer_code_faq_works_title_key = "wallet_transfer_code_faq_works_title"
    /// Versuchen Sie es später erneut.
     case wallet_transfer_code_generate_error_text_key = "wallet_transfer_code_generate_error_text"
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_transfer_code_generate_error_title_key = "wallet_transfer_code_generate_error_title"
    /// Um einen Transfer-Code erstellen zu können, muss die App online sein.
     case wallet_transfer_code_generate_no_internet_error_text_key = "wallet_transfer_code_generate_no_internet_error_text"
    /// Nächste Schritte
     case wallet_transfer_code_next_steps_key = "wallet_transfer_code_next_steps"
    /// Übergeben Sie den Code bei der Testentnahme der Apotheke, dem Testcenter oder der Ärztin / dem Arzt.
     case wallet_transfer_code_next_steps1_key = "wallet_transfer_code_next_steps1"
    /// Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie für jedes Zertifikat einen neuen Code.
     case wallet_transfer_code_next_steps2_key = "wallet_transfer_code_next_steps2"
    /// Keine Verbindung zum Internet
     case wallet_transfer_code_no_internet_title_key = "wallet_transfer_code_no_internet_title"
    /// Code abgelaufen
     case wallet_transfer_code_old_code_key = "wallet_transfer_code_old_code"
    /// Code erstellen
     case wallet_transfer_code_onboarding_button_key = "wallet_transfer_code_onboarding_button"
    /// So funktioniert's
     case wallet_transfer_code_onboarding_howto_key = "wallet_transfer_code_onboarding_howto"
    /// Sie können Transfer-Codes z. B. bei Covid-Tests angeben. Sie erhalten darauf das Covid-Zertifikat direkt in die App geliefert.
     case wallet_transfer_code_onboarding_text_key = "wallet_transfer_code_onboarding_text"
    /// Transfer Codes
     case wallet_transfer_code_onboarding_title_key = "wallet_transfer_code_onboarding_title"
    /// Transfer fehlgeschlagen
     case wallet_transfer_code_state_expired_key = "wallet_transfer_code_state_expired"
    /// Mit diesem Transfer kann kein Zertifikat mehr empfangen werden.
     case wallet_transfer_code_state_no_certificate_key = "wallet_transfer_code_state_no_certificate"
    /// Zuletzt aktualisiert\n{DATE}
     case wallet_transfer_code_state_updated_key = "wallet_transfer_code_state_updated"
    /// Warten auf Transfer
     case wallet_transfer_code_state_waiting_key = "wallet_transfer_code_state_waiting"
    /// Die Uhrzeit muss richtig eingestellt sein, damit Transfer-Codes funktionieren. Passen Sie Ihre Uhrzeit an und versuchen sie es erneut.
     case wallet_transfer_code_time_inconsistency_text_key = "wallet_transfer_code_time_inconsistency_text"
    /// Uhrzeit Fehler
     case wallet_transfer_code_time_inconsistency_title_key = "wallet_transfer_code_time_inconsistency_title"
    /// Transfer-Code
     case wallet_transfer_code_title_key = "wallet_transfer_code_title"
    /// +41 58 466 07 99
     case wallet_transfer_code_unexpected_error_phone_number_key = "wallet_transfer_code_unexpected_error_phone_number"
    /// Kontaktieren Sie den Support
     case wallet_transfer_code_unexpected_error_text_key = "wallet_transfer_code_unexpected_error_text"
    /// Unerwarteter Fehler
     case wallet_transfer_code_unexpected_error_title_key = "wallet_transfer_code_unexpected_error_title"
    /// Aktualisierung zur Zeit nicht möglich
     case wallet_transfer_code_update_error_title_key = "wallet_transfer_code_update_error_title"
    /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
     case wallet_transfer_code_update_general_error_text_key = "wallet_transfer_code_update_general_error_text"
    /// Um den Transfer empfangen zu können, muss die App online sein.
     case wallet_transfer_code_update_no_internet_error_text_key = "wallet_transfer_code_update_no_internet_error_text"
    /// Wollen Sie den Transfer-Code wirklich löschen?
     case wallet_transfer_delete_confirm_text_key = "wallet_transfer_delete_confirm_text"
    /// Mit diesem Update können Sie in der App eine Zertifikatskopie ohne Gesundheitsdaten für die Verwendung in der Schweiz generieren lassen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
     case wallet_update_boarding_certificate_light_text_key = "wallet_update_boarding_certificate_light_text"
    /// Zertifikat Light
     case wallet_update_boarding_certificate_light_title_key = "wallet_update_boarding_certificate_light_title"
    /// Update
     case wallet_update_boarding_header_key = "wallet_update_boarding_header"
    /// UVCI kopiert
     case wallet_uvci_copied_key = "wallet_uvci_copied"
  }

  /// Zertifikat hinzufügen
   static let accessibility_add_button = UBLocalized.tr(UBLocalizedKey.accessibility_add_button_key)
  /// Schliessen
   static let accessibility_close_button = UBLocalized.tr(UBLocalizedKey.accessibility_close_button_key)
  /// erweitert
   static let accessibility_expandable_box_expanded_state = UBLocalized.tr(UBLocalizedKey.accessibility_expandable_box_expanded_state_key)
  /// reduziert
   static let accessibility_expandable_box_reduced_state = UBLocalized.tr(UBLocalizedKey.accessibility_expandable_box_reduced_state_key)
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
  /// QR-Code
   static let accessibility_qr_code = UBLocalized.tr(UBLocalizedKey.accessibility_qr_code_key)
  /// Aktualisieren
   static let accessibility_refresh_button = UBLocalized.tr(UBLocalizedKey.accessibility_refresh_button_key)
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
  /// Ausnahme Zertifikat
   static let covid_certificate_ch_ausnahme_test_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_ch_ausnahme_test_title_key)
  /// Genesung
   static let covid_certificate_recovery_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_recovery_title_key)
  /// Befund
   static let covid_certificate_sero_positiv_test_befund_label = UBLocalized.tr(UBLocalizedKey.covid_certificate_sero_positiv_test_befund_label_key)
  /// Genügend
   static let covid_certificate_sero_positiv_test_befund_value = UBLocalized.tr(UBLocalizedKey.covid_certificate_sero_positiv_test_befund_value_key)
  /// Genesung (Antikörper)
   static let covid_certificate_sero_positiv_test_title = UBLocalized.tr(UBLocalizedKey.covid_certificate_sero_positiv_test_title_key)
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
  /// Ein Speicher der App konnte nicht entschlüsselt werden. Um die App weiter zu benutzen muss der Speicher gelöscht und neu erstellt werden. Dabei gehen Daten verloren.
   static let error_corrupt_sharedprefs_text = UBLocalized.tr(UBLocalizedKey.error_corrupt_sharedprefs_text_key)
  /// Entschlüsselungsfehler
   static let error_corrupt_sharedprefs_title = UBLocalized.tr(UBLocalizedKey.error_corrupt_sharedprefs_title_key)
  /// Zurücksetzen
   static let error_decryption_reset_button = UBLocalized.tr(UBLocalizedKey.error_decryption_reset_button_key)
  /// Zertifikate konnten nicht geladen werden\n\nCode: {ERROR_CODE}
   static let error_decryption_text = UBLocalized.tr(UBLocalizedKey.error_decryption_text_key)
  /// Die Datei enthält entweder keinen gültigen QR-Code oder der QR-Code konnte nicht erkannt werden.
   static let error_file_import_text = UBLocalized.tr(UBLocalizedKey.error_file_import_text_key)
  /// Import fehlgeschlagen
   static let error_file_import_title = UBLocalized.tr(UBLocalizedKey.error_file_import_title_key)
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
  /// Aktualisieren
   static let infobox_update_button = UBLocalized.tr(UBLocalizedKey.infobox_update_button_key)
  /// Laden Sie die neue Version der App.
   static let infobox_update_text = UBLocalized.tr(UBLocalizedKey.infobox_update_text_key)
  /// Neue Version verfügbar
   static let infobox_update_title = UBLocalized.tr(UBLocalizedKey.infobox_update_title_key)
  /// Einstellungen
   static let ios_settings_open = UBLocalized.tr(UBLocalizedKey.ios_settings_open_key)
  /// de
   static let language_key = UBLocalized.tr(UBLocalizedKey.language_key_key)
  /// Sprache
   static let language_title = UBLocalized.tr(UBLocalizedKey.language_title_key)
  /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
   static let NSCameraUsageDescription = UBLocalized.tr(UBLocalizedKey.NSCameraUsageDescription_key)
  /// OK
   static let ok_button = UBLocalized.tr(UBLocalizedKey.ok_button_key)
  /// Kein gültiger Code
   static let qr_scanner_error = UBLocalized.tr(UBLocalizedKey.qr_scanner_error_key)
  /// Einstellungen
   static let settings_title = UBLocalized.tr(UBLocalizedKey.settings_title_key)
  /// Covid-19
   static let target_disease_name = UBLocalized.tr(UBLocalizedKey.target_disease_name_key)
  /// Ein unbekannter Fehler ist aufgetreten.
   static let unknown_error = UBLocalized.tr(UBLocalizedKey.unknown_error_key)
  /// Impftermin
   static let vaccination_appointment_header = UBLocalized.tr(UBLocalizedKey.vaccination_appointment_header_key)
  /// Aargau
   static let vaccination_booking_ag_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ag_name_key)
  /// https://www.ag.ch/coronavirus-impfung
   static let vaccination_booking_ag_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ag_url_key)
  /// Appenzell Innerrhoden
   static let vaccination_booking_ai_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ai_name_key)
  /// https://www.ai.ch/coronavirus-impfung
   static let vaccination_booking_ai_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ai_url_key)
  /// Appenzell Ausserrhoden
   static let vaccination_booking_ar_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ar_name_key)
  /// https://www.ar.ch/verwaltung/departement-gesundheit-und-soziales/amt-fuer-gesundheit/informationsseite-coronavirus/coronaimpfung/
   static let vaccination_booking_ar_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ar_url_key)
  /// Bern
   static let vaccination_booking_be_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_be_name_key)
  /// http://www.be.ch/corona-impfung
   static let vaccination_booking_be_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_be_url_key)
  /// Basel-Landschaft
   static let vaccination_booking_bl_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_bl_name_key)
  /// https://www.bl.ch/impfen
   static let vaccination_booking_bl_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_bl_url_key)
  /// Basel-Stadt
   static let vaccination_booking_bs_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_bs_name_key)
  /// http://www.coronaimpfzentrumbasel.ch
   static let vaccination_booking_bs_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_bs_url_key)
  /// Freiburg
   static let vaccination_booking_fr_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_fr_name_key)
  /// https://www.fr.ch/de/gesundheit/covid-19/covid-19-impfung-in-ihrer-naehe-durch-impfteams-in-den-impfzentren-in-der-apotheke-oder-bei-ihrem-arzt
   static let vaccination_booking_fr_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_fr_url_key)
  /// Genf
   static let vaccination_booking_ge_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ge_name_key)
  /// https://www.ge.ch/se-faire-vacciner-contre-covid-19
   static let vaccination_booking_ge_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ge_url_key)
  /// Glarus
   static let vaccination_booking_gl_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_gl_name_key)
  /// https://www.gl.ch/verwaltung/finanzen-und-gesundheit/gesundheit/coronavirus.html/4817#Impfung
   static let vaccination_booking_gl_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_gl_url_key)
  /// Graubünden
   static let vaccination_booking_gr_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_gr_name_key)
  /// https://www.gr.ch/DE/institutionen/verwaltung/djsg/ga/coronavirus/info/impfen/Seiten/impfen.aspx
   static let vaccination_booking_gr_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_gr_url_key)
  /// Die Covid-19-Impfung ist für Personen ab 12 Jahren empfohlen. Die Impfung ist gratis.
   static let vaccination_booking_info_info = UBLocalized.tr(UBLocalizedKey.vaccination_booking_info_info_key)
  /// Eine Impfung könnte zum Beispiel an diesen Orten in Ihrer Nähe stattfinden:\n\n- in spezifischen Impfzentren\n- in Spitälern\n- bei Ihrem Hausarzt oder Ihrer Hausärztin\n- in Impfapotheken\n\nViele Orte bieten auch Walk-in-Impfungen ohne Termine an.
   static let vaccination_booking_info_text = UBLocalized.tr(UBLocalizedKey.vaccination_booking_info_text_key)
  /// Impftermin in Ihrer Nähe buchen
   static let vaccination_booking_info_title = UBLocalized.tr(UBLocalizedKey.vaccination_booking_info_title_key)
  /// https://bag-coronavirus.ch/impfung/
   static let vaccination_booking_info_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_info_url_key)
  /// Jura
   static let vaccination_booking_ju_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ju_name_key)
  /// https://www.jura.ch/fr/Autorites/Coronavirus/Vaccination.html
   static let vaccination_booking_ju_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ju_url_key)
  /// Luzern
   static let vaccination_booking_lu_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_lu_name_key)
  /// http://www.lu.ch/covid_impfung
   static let vaccination_booking_lu_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_lu_url_key)
  /// Neuenburg
   static let vaccination_booking_ne_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ne_name_key)
  /// https://www.ne.ch/autorites/DFS/SCSP/medecin-cantonal/maladies-vaccinations/covid-19-vaccination/Pages/accueil.aspx
   static let vaccination_booking_ne_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ne_url_key)
  /// Nidwalden
   static let vaccination_booking_nw_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_nw_name_key)
  /// https://www.nw.ch/gesundheitsamtdienste/6044#Impfung
   static let vaccination_booking_nw_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_nw_url_key)
  /// Obwalden
   static let vaccination_booking_ow_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ow_name_key)
  /// https://www.ow.ch/de/verwaltung/dienstleistungen/?dienst_id=5962#Impfung
   static let vaccination_booking_ow_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ow_url_key)
  /// St. Gallen
   static let vaccination_booking_sg_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_sg_name_key)
  /// https://www.sg.ch/coronavirus/impfen
   static let vaccination_booking_sg_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_sg_url_key)
  /// Schaffhausen
   static let vaccination_booking_sh_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_sh_name_key)
  /// https://sh.ch/CMS/Webseite/Kanton-Schaffhausen/Beh-rde/Verwaltung/Departement-des-Innern/Gesundheitsamt-7126057-DE.html
   static let vaccination_booking_sh_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_sh_url_key)
  /// Solothurn
   static let vaccination_booking_so_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_so_name_key)
  /// https://so.ch/coronaimpfung
   static let vaccination_booking_so_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_so_url_key)
  /// Schwyz
   static let vaccination_booking_sz_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_sz_name_key)
  /// https://www.sz.ch/corona-impfen
   static let vaccination_booking_sz_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_sz_url_key)
  /// Thurgau
   static let vaccination_booking_tg_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_tg_name_key)
  /// https://gesundheit.tg.ch/aktuelles/impfung-fuer-covid-19.html/11590
   static let vaccination_booking_tg_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_tg_url_key)
  /// Tessin
   static let vaccination_booking_ti_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ti_name_key)
  /// http://www.ti.ch/vaccinazione
   static let vaccination_booking_ti_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ti_url_key)
  /// Uri
   static let vaccination_booking_ur_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ur_name_key)
  /// https://www.ur.ch/themen/3673
   static let vaccination_booking_ur_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_ur_url_key)
  /// Waadt
   static let vaccination_booking_vd_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_vd_name_key)
  /// https://vd.ch/coronavirus-vaccins
   static let vaccination_booking_vd_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_vd_url_key)
  /// Wallis
   static let vaccination_booking_vs_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_vs_name_key)
  /// https://www.vs.ch/de/web/coronavirus#ancre_vaccination
   static let vaccination_booking_vs_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_vs_url_key)
  /// Zug
   static let vaccination_booking_zg_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_zg_name_key)
  /// https://www.corona-impfung-zug.ch/
   static let vaccination_booking_zg_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_zg_url_key)
  /// Zürich
   static let vaccination_booking_zh_name = UBLocalized.tr(UBLocalizedKey.vaccination_booking_zh_name_key)
  /// http://www.zh.ch/coronaimpfung
   static let vaccination_booking_zh_url = UBLocalized.tr(UBLocalizedKey.vaccination_booking_zh_url_key)
  /// Wählen Sie Ihren Kanton
   static let vaccination_choose_your_canton = UBLocalized.tr(UBLocalizedKey.vaccination_choose_your_canton_key)
  /// Mit der Covid-19-Impfung können Sie auf das wiederholte Testen verzichten.
   static let vaccination_hint_text_1 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_1_key)
  /// Mit der Covid-19-Impfung können Sie unbeschwert in die meisten Länder reisen.
   static let vaccination_hint_text_2 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_2_key)
  /// Mit der Covid-19-Impfung können Sie sich vor Erkrankung und einem allfälligen schweren Verlauf schützen.
   static let vaccination_hint_text_3 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_3_key)
  /// Mit der Covid-19-Impfung können Sie auf sichere Art immun werden.
   static let vaccination_hint_text_4 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_4_key)
  /// Mit der Covid-19-Impfung können Sie mithelfen, die Krankheitslast zu reduzieren.
   static let vaccination_hint_text_5 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_5_key)
  /// Mit der Covid-19-Impfung können Sie helfen, die Auswirkungen der Pandemie zu bekämpfen.
   static let vaccination_hint_text_6 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_6_key)
  /// Mit der Covid-19-Impfung können Sie die Langzeitfolgen einer Covid-19-Erkrankung vermeiden.
   static let vaccination_hint_text_7 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_7_key)
  /// Mit der Covid-19-Impfung können Sie dazu beitragen, das Gesundheitswesen zu entlasten.
   static let vaccination_hint_text_8 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_8_key)
  /// Mit der Covid-19-Impfung können Sie dazu beitragen, die Freiheiten des Alltags zurückzubringen.
   static let vaccination_hint_text_9 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_text_9_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_1 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_1_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_2 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_2_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_3 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_3_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_4 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_4_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_5 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_5_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_6 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_6_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_7 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_7_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_8 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_8_key)
  /// Jetzt impfen lassen!
   static let vaccination_hint_title_9 = UBLocalized.tr(UBLocalizedKey.vaccination_hint_title_9_key)
  /// Impftermin buchen
   static let vaccination_homescreen_button_title = UBLocalized.tr(UBLocalizedKey.vaccination_homescreen_button_title_key)
  /// Zum Impf-Check
   static let vaccination_impf_check_action = UBLocalized.tr(UBLocalizedKey.vaccination_impf_check_action_key)
  /// Der Covid-19 Impf-Check gibt Auskunft über Erst- sowie Auffrischimpfungen und führt Sie zur entsprechenden Anlaufstelle in Ihrem Kanton.
   static let vaccination_impf_check_info_text = UBLocalized.tr(UBLocalizedKey.vaccination_impf_check_info_text_key)
  /// Jetzt Termin buchen
   static let vaccination_impf_check_title = UBLocalized.tr(UBLocalizedKey.vaccination_impf_check_title_key)
  /// https://covid19.impf-check.ch/
   static let vaccination_impf_check_url = UBLocalized.tr(UBLocalizedKey.vaccination_impf_check_url_key)
  /// Informationen zur Impfung
   static let vaccination_information_button_in_certificate = UBLocalized.tr(UBLocalizedKey.vaccination_information_button_in_certificate_key)
  /// Weitere Informationen rund um die Covid-19-Impfung
   static let vaccination_more_information_title = UBLocalized.tr(UBLocalizedKey.vaccination_more_information_title_key)
  /// market://details?id=ch.admin.bag.covidcertificate.verifier
   static let verifier_android_app_google_play_store_url = UBLocalized.tr(UBLocalizedKey.verifier_android_app_google_play_store_url_key)
  /// Covid Check
   static let verifier_app_name = UBLocalized.tr(UBLocalizedKey.verifier_app_name_key)
  /// COVID Certificate Check
   static let verifier_app_title = UBLocalized.tr(UBLocalizedKey.verifier_app_title_key)
  /// http://itunes.apple.com/app/id1565917510
   static let verifier_apple_app_store_url = UBLocalized.tr(UBLocalizedKey.verifier_apple_app_store_url_key)
  /// Gültigkeit des Zertifikats\nabgelaufen
   static let verifier_certificate_light_error_expired = UBLocalized.tr(UBLocalizedKey.verifier_certificate_light_error_expired_key)
  /// Für Betriebe und Veranstalter mit 2G-Regel. Es werden nur Zertifikate von Impfungen und Genesungen akzeptiert.
   static let verifier_check_mode_info_2g_text_1 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_2g_text_1_key)
  /// Zertifikate von Covid-Tests werden als ungültig dargestellt.
   static let verifier_check_mode_info_2g_text_2 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_2g_text_2_key)
  /// Light-Zertifikate können im 2G-Modus nicht geprüft werden.
   static let verifier_check_mode_info_2g_text_3 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_2g_text_3_key)
  /// 2G
   static let verifier_check_mode_info_2g_title = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_2g_title_key)
  /// Für Betriebe und Veranstalter mit 3G-Regel.
   static let verifier_check_mode_info_3g_text_1 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_3g_text_1_key)
  /// Es werden gültige Zertifikate von Impfungen, Genesungen und Tests akzeptiert.
   static let verifier_check_mode_info_3g_text_2 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_3g_text_2_key)
  /// Light-Zertifikate können geprüft werden.
   static let verifier_check_mode_info_3g_text_3 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_3g_text_3_key)
  /// 3G
   static let verifier_check_mode_info_3g_title = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_3g_title_key)
  /// Wählen Sie den Modus, in dem Sie Zertifikate prüfen müssen.
   static let verifier_check_mode_info_unselected_text_1 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_unselected_text_1_key)
  /// Die Einstellungen können jederzeit geändert werden
   static let verifier_check_mode_info_unselected_text_2 = UBLocalized.tr(UBLocalizedKey.verifier_check_mode_info_unselected_text_2_key)
  /// wählen
   static let verifier_choose_mode_button_title = UBLocalized.tr(UBLocalizedKey.verifier_choose_mode_button_title_key)
  /// Geburtsdatum
   static let verifier_covid_certificate_birthdate = UBLocalized.tr(UBLocalizedKey.verifier_covid_certificate_birthdate_key)
  /// Nachname
   static let verifier_covid_certificate_name = UBLocalized.tr(UBLocalizedKey.verifier_covid_certificate_name_key)
  /// Vorname
   static let verifier_covid_certificate_prename = UBLocalized.tr(UBLocalizedKey.verifier_covid_certificate_prename_key)
  /// Das Format des Covid-Zertifikats ist ungültig.
   static let verifier_error_invalid_format = UBLocalized.tr(UBLocalizedKey.verifier_error_invalid_format_key)
  /// Ihr gewählter Prüfmodus existiert nicht mehr.
   static let verifier_error_mode_no_longer_exists = UBLocalized.tr(UBLocalizedKey.verifier_error_mode_no_longer_exists_key)
  /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App mit der dafür vorgesehenen COVID Certificate Check App.
   static let verifier_faq_works_answer_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_1_key)
  /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
   static let verifier_faq_works_answer_2 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_2_key)
  /// Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
   static let verifier_faq_works_answer_2_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_2_1_key)
  /// Neben Pass oder ID werden auch andere Ausweisdokumente akzeptiert, die die Identität der betreffenden Person mit einem Foto belegen (z.B. Führerausweis). Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
   static let verifier_faq_works_answer_3 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_3_key)
  /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
   static let verifier_faq_works_answer_4 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_4_key)
  /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum der Zertifikatsinhaberin oder des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
   static let verifier_faq_works_answer_5 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_5_key)
  /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
   static let verifier_faq_works_answer_6 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_6_key)
  /// Grundsätzlich können Covid-Zertifikate auch ohne eine Internetverbindung geprüft werden. Dazu werden regelmässig aktualisierte Prüflisten von einem zentralen Server heruntergeladen. Diese lokal gespeicherten Prüflisten dürfen nicht älter als 48h sein. \n\nUm die Prüflisten zu aktualisieren muss die App mit dem Internet verbunden sein und geöffnet werden. Die Aktualisierung erfolgt unmittelbar und automatisch.
   static let verifier_faq_works_answer_7 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_7_key)
  /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
   static let verifier_faq_works_answer_8 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_8_key)
  /// Das Zertifikat Light kann durch die Halterin / den Halter jederzeit in der «COVID Certificate»-App deaktiviert werden. Danach steht das normale Covid-Zertifikat wieder zur Verfügung.
   static let verifier_faq_works_answer_9 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_answer_9_key)
  /// Erklärvideo
   static let verifier_faq_works_linktext_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_linktext_1_key)
  /// Weitere Informationen
   static let verifier_faq_works_linktext_2_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_linktext_2_1_key)
  /// 
   static let verifier_faq_works_linkurl_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_linkurl_1_key)
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/covid-zertifikat.html#-837133624
   static let verifier_faq_works_linkurl_2_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_linkurl_2_1_key)
  /// Wie können Covid-Zertifikate geprüft werden?
   static let verifier_faq_works_question_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_1_key)
  /// Was wird genau geprüft?
   static let verifier_faq_works_question_2 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_2_key)
  /// Was sind die aktuellen Gültigkeitskriterien der Schweiz?
   static let verifier_faq_works_question_2_1 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_2_1_key)
  /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
   static let verifier_faq_works_question_3 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_3_key)
  /// Können auch ausländische Zertifikate geprüft werden?
   static let verifier_faq_works_question_4 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_4_key)
  /// Welche Daten sehe ich beim Prüfvorgang?
   static let verifier_faq_works_question_5 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_5_key)
  /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
   static let verifier_faq_works_question_6 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_6_key)
  /// Können Zertifikate auch offline geprüft werden?
   static let verifier_faq_works_question_7 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_7_key)
  /// Was ist das Zertifikat Light?
   static let verifier_faq_works_question_8 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_8_key)
  /// Wie kann ein Zertifikat Light wieder in ein EU/EFTA-konformes Covid-Zertifikat umgewandelt werden?
   static let verifier_faq_works_question_9 = UBLocalized.tr(UBLocalizedKey.verifier_faq_works_question_9_key)
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
  /// Prüfen ({MODE})
   static let verifier_homescreen_scan_button_with_mode = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_scan_button_with_mode_key)
  /// So funktioniert's
   static let verifier_homescreen_support_button = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_support_button_key)
  /// Check
   static let verifier_homescreen_title = UBLocalized.tr(UBLocalizedKey.verifier_homescreen_title_key)
  /// Prüfmodus
   static let verifier_mode_title = UBLocalized.tr(UBLocalizedKey.verifier_mode_title_key)
  /// Ein unerwarteter Fehler ist aufgetreten.
   static let verifier_network_error_text = UBLocalized.tr(UBLocalizedKey.verifier_network_error_text_key)
  /// Prüfung fehlgeschlagen
   static let verifier_network_error_title = UBLocalized.tr(UBLocalizedKey.verifier_network_error_title_key)
  /// Eine Internetverbindung wird benötigt, um die Prüflisten zu aktualisieren
   static let verifier_offline_error_text = UBLocalized.tr(UBLocalizedKey.verifier_offline_error_text_key)
  /// Offline-Prüfung nicht möglich
   static let verifier_offline_error_title = UBLocalized.tr(UBLocalizedKey.verifier_offline_error_title_key)
  /// Externer Hardwarescanner erkannt
   static let verifier_qr_scanner_external_hardware_detected = UBLocalized.tr(UBLocalizedKey.verifier_qr_scanner_external_hardware_detected_key)
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
  /// Mit diesem Update können Sie in der App auch die Zertifikatskopie ohne Gesundheitsdaten prüfen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
   static let verifier_update_boarding_certificate_light_text = UBLocalized.tr(UBLocalizedKey.verifier_update_boarding_certificate_light_text_key)
  /// Zertifikat Light
   static let verifier_update_boarding_certificate_light_title = UBLocalized.tr(UBLocalizedKey.verifier_update_boarding_certificate_light_title_key)
  /// Update
   static let verifier_update_boarding_header = UBLocalized.tr(UBLocalizedKey.verifier_update_boarding_header_key)
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDie Gültigkeit des Zertifikat ist abgelaufen.
   static let verifier_verifiy_error_expired = UBLocalized.tr(UBLocalizedKey.verifier_verifiy_error_expired_key)
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDas Zertifikat ist noch nicht gültig.
   static let verifier_verifiy_error_notyetvalid = UBLocalized.tr(UBLocalizedKey.verifier_verifiy_error_notyetvalid_key)
  /// Das Covid-Zertifikat wurde widerrufen
   static let verifier_verify_error_info_for_blacklist = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_info_for_blacklist_key)
  /// Das Covid-Zertifikat hat keine gültige Signatur
   static let verifier_verify_error_info_for_certificate_invalid = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_info_for_certificate_invalid_key)
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz oder des Prüfmodus ({MODUS})
   static let verifier_verify_error_info_for_national_rules = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_info_for_national_rules_key)
  /// Ein unerwarteter Fehler ist aufgetreten.
   static let verifier_verify_error_list_info_text = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_list_info_text_key)
  /// Prüfung fehlgeschlagen
   static let verifier_verify_error_list_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_list_title_key)
  /// Covid-Zertifikat ungültig
   static let verifier_verify_error_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_title_key)
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz.
   static let verifier_verify_error_validity_range_bold = UBLocalized.tr(UBLocalizedKey.verifier_verify_error_validity_range_bold_key)
  /// Die Prüfung kann in diesem Fall nur erfolgen, wenn die Umwandlung in ein Zertifikat Light rückgängig gemacht wird.
   static let verifier_verify_light_not_supported_by_mode_text = UBLocalized.tr(UBLocalizedKey.verifier_verify_light_not_supported_by_mode_text_key)
  /// Beim zu prüfenden Covid-Zertifikat handelt es sich um ein Zertifikat Light. Dies kann im {MODUS}-Prüfmodus nicht geprüft werden.
   static let verifier_verify_light_not_supported_by_mode_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_light_not_supported_by_mode_title_key)
  /// Zertifikat wird geprüft
   static let verifier_verify_loading_text = UBLocalized.tr(UBLocalizedKey.verifier_verify_loading_text_key)
  /// Nur mit einem Ausweisdokument \n& innerhalb der Schweiz gültig
   static let verifier_verify_success_certificate_light_info = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_certificate_light_info_key)
  /// Nur mit einem \nAusweisdokument gültig
   static let verifier_verify_success_info = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_info_key)
  /// Nicht widerrufen
   static let verifier_verify_success_info_for_blacklist = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_info_for_blacklist_key)
  /// Signatur gültig
   static let verifier_verify_success_info_for_certificate_valid = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_info_for_certificate_valid_key)
  /// Prüfung erfolgreich
   static let verifier_verify_success_title = UBLocalized.tr(UBLocalizedKey.verifier_verify_success_title_key)
  /// Noch {TIMESPAN} gültig
   static let wallet_accessibility_light_certificate_expiration_timer = UBLocalized.tr(UBLocalizedKey.wallet_accessibility_light_certificate_expiration_timer_key)
  /// Hinzufügen
   static let wallet_add_certificate = UBLocalized.tr(UBLocalizedKey.wallet_add_certificate_key)
  /// Hinzufügen
   static let wallet_add_certificate_button = UBLocalized.tr(UBLocalizedKey.wallet_add_certificate_button_key)
  /// market://details?id=ch.admin.bag.covidcertificate.wallet
   static let wallet_android_app_google_play_store_url = UBLocalized.tr(UBLocalizedKey.wallet_android_app_google_play_store_url_key)
  /// Covid Cert
   static let wallet_app_name = UBLocalized.tr(UBLocalizedKey.wallet_app_name_key)
  /// http://itunes.apple.com/app/id1565917320
   static let wallet_apple_app_store_url = UBLocalized.tr(UBLocalizedKey.wallet_apple_app_store_url_key)
  /// Covid-Zertifikat
   static let wallet_certificate = UBLocalized.tr(UBLocalizedKey.wallet_certificate_key)
  /// Dieses Zertifikat ist bereits in der App gespeichert
   static let wallet_certificate_already_exists = UBLocalized.tr(UBLocalizedKey.wallet_certificate_already_exists_key)
  /// Verantwortliche Stelle für Ausstellung
   static let wallet_certificate_ausnahme_responsible_issuer = UBLocalized.tr(UBLocalizedKey.wallet_certificate_ausnahme_responsible_issuer_key)
  /// Startdatum des Attests
   static let wallet_certificate_ausnahme_test_attest_start_date = UBLocalized.tr(UBLocalizedKey.wallet_certificate_ausnahme_test_attest_start_date_key)
  /// Zertifikat erstellt am\n{DATE}
   static let wallet_certificate_date = UBLocalized.tr(UBLocalizedKey.wallet_certificate_date_key)
  /// Wollen Sie das Zertifikat wirklich löschen?
   static let wallet_certificate_delete_confirm_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_delete_confirm_text_key)
  /// Zertifikat Light
   static let wallet_certificate_detail_certificate_light_button = UBLocalized.tr(UBLocalizedKey.wallet_certificate_detail_certificate_light_button_key)
  /// Date format used: dd.mm.yyyy
   static let wallet_certificate_detail_date_format_info = UBLocalized.tr(UBLocalizedKey.wallet_certificate_detail_date_format_info_key)
  /// Exportieren
   static let wallet_certificate_detail_export_button = UBLocalized.tr(UBLocalizedKey.wallet_certificate_detail_export_button_key)
  /// Dieses Zertifikat ist kein Reisedokument. \n\nDie wissenschaftlichen Erkenntnisse über Covid-19-Impfungen und -Tests sowie über die Genesung von einer Covid-19-Infektion entwickeln sich ständig weiter, auch im Hinblick auf neue besorgniserregende Virusvarianten. \n\nBitte informieren Sie sich vor der Reise über die am Zielort geltenden Gesundheitsmassnahmen und damit verbundenen Beschränkungen.
   static let wallet_certificate_detail_note = UBLocalized.tr(UBLocalizedKey.wallet_certificate_detail_note_key)
  /// Nachweis erstellt am\n{DATE}
   static let wallet_certificate_evidence_creation_date = UBLocalized.tr(UBLocalizedKey.wallet_certificate_evidence_creation_date_key)
  /// Nachweis
   static let wallet_certificate_evidence_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_evidence_title_key)
  /// Exportieren
   static let wallet_certificate_export_button = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_button_key)
  /// PDF konnte nicht\nerstellt werden
   static let wallet_certificate_export_detail_error_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_error_title_key)
  /// Exportieren
   static let wallet_certificate_export_detail_export_button = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_export_button_key)
  /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
   static let wallet_certificate_export_detail_general_error_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_general_error_text_key)
  /// Ein unerwarteter Fehler ist aufgetreten.
   static let wallet_certificate_export_detail_general_error_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_general_error_title_key)
  /// Um das PDF erstellen zu können, muss die App online sein.
   static let wallet_certificate_export_detail_network_error_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_network_error_text_key)
  /// Keine Verbindung zum Internet
   static let wallet_certificate_export_detail_network_error_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_network_error_title_key)
  /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
   static let wallet_certificate_export_detail_summary_1 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_summary_1_key)
  /// Die Erstellung des PDF-Dokuments erfolgt online.
   static let wallet_certificate_export_detail_summary_2 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_summary_2_key)
  /// Exportieren
   static let wallet_certificate_export_detail_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_detail_title_key)
  /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
   static let wallet_certificate_export_summary_1 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_summary_1_key)
  /// Die Erstellung des PDF-Dokuments erfolgt online.
   static let wallet_certificate_export_summary_2 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_summary_2_key)
  /// Covid-Zertifikat exportieren
   static let wallet_certificate_export_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_export_title_key)
  /// UVCI
   static let wallet_certificate_identifier = UBLocalized.tr(UBLocalizedKey.wallet_certificate_identifier_key)
  /// Impfdosis
   static let wallet_certificate_impfdosis_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfdosis_title_key)
  /// Hersteller
   static let wallet_certificate_impfstoff_holder = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfstoff_holder_key)
  /// Produkt
   static let wallet_certificate_impfstoff_product_name_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_impfstoff_product_name_title_key)
  /// Aktivieren
   static let wallet_certificate_light_detail_activate_button = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_activate_button_key)
  /// Zertifikat Light\nkonnte nicht aktiviert werden
   static let wallet_certificate_light_detail_activation_error = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_activation_error_key)
  /// Versuchen Sie es später erneut.
   static let wallet_certificate_light_detail_activation_general_error_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_activation_general_error_text_key)
  /// Ein unerwarteter Fehler ist aufgetreten.
   static let wallet_certificate_light_detail_activation_general_error_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_activation_general_error_title_key)
  /// Um das Zertifikat Light aktivieren zu können, muss die App online sein.
   static let wallet_certificate_light_detail_activation_network_error_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_activation_network_error_text_key)
  /// Keine Verbindung zum Internet
   static let wallet_certificate_light_detail_activation_network_error_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_activation_network_error_title_key)
  /// Deaktivieren
   static let wallet_certificate_light_detail_deactivate_button = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_deactivate_button_key)
  /// Kann nur innerhalb der Schweiz verwendet werden
   static let wallet_certificate_light_detail_summary_1 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_summary_1_key)
  /// Enthält nur Namen, Vornamen, Geburtsdatum und eine elektronische Signatur
   static let wallet_certificate_light_detail_summary_2 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_summary_2_key)
  /// Gültig für max. 24 Stunden
   static let wallet_certificate_light_detail_summary_3 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_summary_3_key)
  /// Die Konvertierung des Covid-Zertifikats in ein Zertifikat Light erfolgt online.
   static let wallet_certificate_light_detail_summary_4 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_summary_4_key)
  /// Sie können das Zertifikat Light jederzeit deaktivieren, um wieder zum normalen Covid-Zertifikat zu wechseln.
   static let wallet_certificate_light_detail_summary_5 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_summary_5_key)
  /// Zertifikat Light
   static let wallet_certificate_light_detail_summary_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_summary_title_key)
  /// Wenn Sie das Zertifikat Light aktivieren, wird aus den Daten Ihres Covid-Zertifikats ein neuer QR-Code erstellt, der keine Gesundheitsdaten enthält.
   static let wallet_certificate_light_detail_text_1 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_text_1_key)
  /// Während das normale Covid-Zertifikat im Rahmen seiner Gültigkeit ohne Einschränkungen sowohl in der Schweiz als auch in der EU/EFTA verwendet werden kann, ist der Einsatz des Zertifikats Light nur in der Schweiz möglich. Aus Datenschutzgründen muss das Zertifikat Light nach 24 Stunden erneut aktiviert werden. Es bringt keine zusätzlichen Rechte gegenüber dem normalen Covid-Zertifikat.
   static let wallet_certificate_light_detail_text_2 = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_text_2_key)
  /// nur muss keine
   static let wallet_certificate_light_detail_text_2_bold = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_text_2_bold_key)
  /// Was ist ein \nZertifikat Light?
   static let wallet_certificate_light_detail_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_detail_title_key)
  /// Das Zertifikat Light wurde in den letzten 24h bereits zu oft aktiviert.
   static let wallet_certificate_light_rate_limit_text = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_rate_limit_text_key)
  /// 24h-Limite erreicht
   static let wallet_certificate_light_rate_limit_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_rate_limit_title_key)
  /// Zertifikat Light
   static let wallet_certificate_light_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_light_title_key)
  /// Light
   static let wallet_certificate_list_light_certificate_badge = UBLocalized.tr(UBLocalizedKey.wallet_certificate_list_light_certificate_badge_key)
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
  /// Hersteller und Name
   static let wallet_certificate_test_holder_and_name = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_holder_and_name_key)
  /// Land des Tests
   static let wallet_certificate_test_land = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_land_key)
  /// Name
   static let wallet_certificate_test_name = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_name_key)
  /// Datum Resultat
   static let wallet_certificate_test_result_date_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_date_title_key)
  /// Nicht erkannt (Negativ)
   static let wallet_certificate_test_result_negativ = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_negativ_key)
  /// Erkannt (Positiv)
   static let wallet_certificate_test_result_positiv = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_positiv_key)
  /// Ergebnis
   static let wallet_certificate_test_result_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_result_title_key)
  /// Datum der Probenentnahme
   static let wallet_certificate_test_sample_date_title = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_sample_date_title_key)
  /// Typ
   static let wallet_certificate_test_type = UBLocalized.tr(UBLocalizedKey.wallet_certificate_test_type_key)
  /// Unvollständige Impfung
   static let wallet_certificate_type_incomplete_vaccine = UBLocalized.tr(UBLocalizedKey.wallet_certificate_type_incomplete_vaccine_key)
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
  /// Hier könnte ein Text stehen, der erklärt was 2G bedeutet und dass der Zertifikatstyp für 2G NICHT ok ist.
   static let wallet_check_mode_info_2g_not_ok_text = UBLocalized.tr(UBLocalizedKey.wallet_check_mode_info_2g_not_ok_text_key)
  /// Hier könnte ein Text stehen, der erklärt was 2G bedeutet und dass der Zertifikatstyp für 2G ok ist.
   static let wallet_check_mode_info_2g_ok_text = UBLocalized.tr(UBLocalizedKey.wallet_check_mode_info_2g_ok_text_key)
  /// Hier könnte ein Text stehen, der erklärt was 3G bedeutet und dass der Zertifikatstyp für 3G NICHT ok ist.
   static let wallet_check_mode_info_3g_not_ok_text = UBLocalized.tr(UBLocalizedKey.wallet_check_mode_info_3g_not_ok_text_key)
  /// Hier könnte ein Text stehen, der erklärt was 3G bedeutet und dass der Zertifikatstyp für 3G ok ist.
   static let wallet_check_mode_info_3g_ok_text = UBLocalized.tr(UBLocalizedKey.wallet_check_mode_info_3g_ok_text_key)
  /// Infos
   static let wallet_check_mode_info_title = UBLocalized.tr(UBLocalizedKey.wallet_check_mode_info_title_key)
  /// Versuchen Sie es später erneut.
   static let wallet_detail_network_error_text = UBLocalized.tr(UBLocalizedKey.wallet_detail_network_error_text_key)
  /// Prüfung zur Zeit nicht möglich
   static let wallet_detail_network_error_title = UBLocalized.tr(UBLocalizedKey.wallet_detail_network_error_title_key)
  /// Prüfung offline nicht möglich
   static let wallet_detail_offline_retry_title = UBLocalized.tr(UBLocalizedKey.wallet_detail_offline_retry_title_key)
  /// Gültigkeit des Zertifikats\nabgelaufen
   static let wallet_error_expired = UBLocalized.tr(UBLocalizedKey.wallet_error_expired_key)
  /// abgelaufen
   static let wallet_error_expired_bold = UBLocalized.tr(UBLocalizedKey.wallet_error_expired_bold_key)
  /// Format des Zertifikat\nungültig
   static let wallet_error_invalid_format = UBLocalized.tr(UBLocalizedKey.wallet_error_invalid_format_key)
  /// ungültig
   static let wallet_error_invalid_format_bold = UBLocalized.tr(UBLocalizedKey.wallet_error_invalid_format_bold_key)
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
  /// Von Covid-19 genesene Personen können das Covid-Zertifikat über ein Online-Formular auf der Webseite des Kantons beantragen. Das Covid-Zertifikat wird anschliessend per Post zugeschickt.
   static let wallet_faq_questions_answer_1_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_1_1_key)
  /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass Sie in jedem Fall auf Verlangen auch noch ein Ausweisdokument vorweisen müssen.
   static let wallet_faq_questions_answer_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_2_key)
  /// Die Gültigkeitsdauer unterscheidet sich je nachdem, ob Sie eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis haben. Aufgrund neuer wissenschaftlicher Erkenntnisse kann sich die Gültigkeitsdauer verändern. Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
   static let wallet_faq_questions_answer_2_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_2_1_key)
  /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
   static let wallet_faq_questions_answer_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_3_key)
  /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument gültig.
   static let wallet_faq_questions_answer_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_4_key)
  /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier deshalb sorgfältig auf. Bei Verlust müssen Sie das Covid-Zertifikat erneut bei der ausgebenden Stelle anfragen.
   static let wallet_faq_questions_answer_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_5_key)
  /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
   static let wallet_faq_questions_answer_6 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_answer_6_key)
  /// Weitere Informationen
   static let wallet_faq_questions_linktext_2_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_linktext_2_1_key)
  /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/#contents2
   static let wallet_faq_questions_linkurl_2_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_linkurl_2_1_key)
  /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
   static let wallet_faq_questions_question_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_1_key)
  /// Wie erhalte ich nach einer durchgemachten Covid-19-Erkrankung ein Covid-Zertifikat?
   static let wallet_faq_questions_question_1_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_1_1_key)
  /// Wie kann ich ein Covid-Zertifikat vorweisen?
   static let wallet_faq_questions_question_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_2_key)
  /// Wie lange ist das Covid-Zertifikat gültig?
   static let wallet_faq_questions_question_2_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_2_1_key)
  /// Wo sind meine Daten gespeichert?
   static let wallet_faq_questions_question_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_3_key)
  /// Wie werden Missbrauch und Fälschung verhindert?
   static let wallet_faq_questions_question_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_4_key)
  /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
   static let wallet_faq_questions_question_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_5_key)
  /// Was ist das Zertifikat Light?
   static let wallet_faq_questions_question_6 = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_question_6_key)
  /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
   static let wallet_faq_questions_subtitle = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_subtitle_key)
  /// Was sind Covid-Zertifikate?
   static let wallet_faq_questions_title = UBLocalized.tr(UBLocalizedKey.wallet_faq_questions_title_key)
  /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
   static let wallet_faq_works_answer_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_1_key)
  /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument des Zertifikatsinhabers / der Zertifikatsinhaberin gültig.
   static let wallet_faq_works_answer_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_2_key)
  /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
   static let wallet_faq_works_answer_2_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_2_1_key)
  /// In der COVID Certificate App wird ausgewiesen, wann Ihr Covid-Zertifikat in der Schweiz ablaufen wird. Sie können in der Detail-Ansicht zudem per Knopfdruck überprüfen, ob Ihr Covid-Zertifikat aktuell gültig ist.
   static let wallet_faq_works_answer_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_3_key)
  /// Sie können die App ohne eine Internetverbindung verwenden. Auch im Offline-Modus können Zertifikate vorgewiesen und von den Prüfern gescannt und verifiziert werden.\n\nUm in der «COVID Certificate»-App anzeigen zu können, ob ihr Zertifikat den Gültigkeitskriterien der Schweiz entspricht und bis wann Ihr Zertifikat gültig ist, muss die App jedoch regelmässig online sein.
   static let wallet_faq_works_answer_3_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_3_1_key)
  /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
   static let wallet_faq_works_answer_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_4_key)
  /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
   static let wallet_faq_works_answer_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_5_key)
  /// In der «COVID Certificate»-App finden Sie in der Detailansicht des elektronische Covid-Zertifikats die Funktion «Exportieren». Damit können Sie ein PDF erstellen, dieses speichern und ausdrucken.
   static let wallet_faq_works_answer_5_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_5_1_key)
  /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihrem Mobilgerät speichern. Laden Sie dazu die App erneut herunter und scannen Sie anschliessend den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
   static let wallet_faq_works_answer_6 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_answer_6_key)
  /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
   static let wallet_faq_works_question_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_1_key)
  /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
   static let wallet_faq_works_question_2 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_2_key)
  /// Was ist ein Transfer-Code?
   static let wallet_faq_works_question_2_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_2_1_key)
  /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
   static let wallet_faq_works_question_3 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_3_key)
  /// Kann ich die App auch offline verwenden?
   static let wallet_faq_works_question_3_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_3_1_key)
  /// Wie sind meine Daten geschützt?
   static let wallet_faq_works_question_4 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_4_key)
  /// Welche Daten sind im QR-Code enthalten?
   static let wallet_faq_works_question_5 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_5_key)
  /// Ich habe das Covid-Zertifikat ausschliesslich elektronisch in der App. Wie komme ich zum Zertifikat als PDF oder auf Papier?
   static let wallet_faq_works_question_5_1 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_5_1_key)
  /// Was muss ich tun, wenn ich das Covid-Zertifikat oder die App lösche?
   static let wallet_faq_works_question_6 = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_question_6_key)
  /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
   static let wallet_faq_works_subtitle = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_subtitle_key)
  /// Wie funktioniert \ndie App?
   static let wallet_faq_works_title = UBLocalized.tr(UBLocalizedKey.wallet_faq_works_title_key)
  /// Sie haben ein Covid-Zertifikat auf Papier oder als PDF und möchten es zur App hinzufügen.
   static let wallet_homescreen_add_certificate_description = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_add_certificate_description_key)
  /// Zertifikat hinzufügen
   static let wallet_homescreen_add_title = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_add_title_key)
  /// Transfer-Code erstellen
   static let wallet_homescreen_add_transfer_code = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_add_transfer_code_key)
  /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
   static let wallet_homescreen_explanation = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_explanation_key)
  /// Gültigkeit konnte nicht ermittelt werden
   static let wallet_homescreen_network_error = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_network_error_key)
  /// Offline Modus
   static let wallet_homescreen_offline = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_offline_key)
  /// PDF importieren
   static let wallet_homescreen_pdf_import = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_pdf_import_key)
  /// QR-Code scannen
   static let wallet_homescreen_qr_code_scannen = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_qr_code_scannen_key)
  /// Nächsten Schritt wählen
   static let wallet_homescreen_what_to_do = UBLocalized.tr(UBLocalizedKey.wallet_homescreen_what_to_do_key)
  /// Zur Check-App
   static let wallet_info_box_certificate_scan_button_check_app = UBLocalized.tr(UBLocalizedKey.wallet_info_box_certificate_scan_button_check_app_key)
  /// Verstanden
   static let wallet_info_box_certificate_scan_close = UBLocalized.tr(UBLocalizedKey.wallet_info_box_certificate_scan_close_key)
  /// Für eine Datenschutzkonforme und schnellere Prüfung nutzen Sie die "COVID Certificate Check"-App.
   static let wallet_info_box_certificate_scan_text = UBLocalized.tr(UBLocalizedKey.wallet_info_box_certificate_scan_text_key)
  /// «COVID Certificate Check»-App.
   static let wallet_info_box_certificate_scan_text_bold = UBLocalized.tr(UBLocalizedKey.wallet_info_box_certificate_scan_text_bold_key)
  /// Wollen Sie Zertifikate überprüfen?
   static let wallet_info_box_certificate_scan_title = UBLocalized.tr(UBLocalizedKey.wallet_info_box_certificate_scan_title_key)
  /// Aktivieren
   static let wallet_notification_disabled_button = UBLocalized.tr(UBLocalizedKey.wallet_notification_disabled_button_key)
  /// Tipp: Mitteilungen aktivieren
   static let wallet_notification_disabled_titel = UBLocalized.tr(UBLocalizedKey.wallet_notification_disabled_titel_key)
  /// Weiter
   static let wallet_notification_permission_button = UBLocalized.tr(UBLocalizedKey.wallet_notification_permission_button_key)
  /// Die App kann Sie informieren, sobald das Zertifikat eingetroffen ist.  Erlauben Sie dazu der App, Ihnen Mitteilungen zu senden.
   static let wallet_notification_permission_text = UBLocalized.tr(UBLocalizedKey.wallet_notification_permission_text_key)
  /// Mitteilungen erlauben
   static let wallet_notification_permission_title = UBLocalized.tr(UBLocalizedKey.wallet_notification_permission_title_key)
  /// Das Covid-Zertifikat ist eingetroffen
   static let wallet_notification_transfer_text = UBLocalized.tr(UBLocalizedKey.wallet_notification_transfer_text_key)
  /// Transfer erfolgreich
   static let wallet_notification_transfer_title = UBLocalized.tr(UBLocalizedKey.wallet_notification_transfer_title_key)
  /// Um die aktuelle Gültigkeit anzeigen zu können, muss die App regelmässig online sein.
   static let wallet_offline_description = UBLocalized.tr(UBLocalizedKey.wallet_offline_description_key)
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
  /// Nur mit einem Ausweisdokument \n& innerhalb der Schweiz gültig
   static let wallet_only_valid_in_switzerland = UBLocalized.tr(UBLocalizedKey.wallet_only_valid_in_switzerland_key)
  /// Erneut scannen
   static let wallet_scan_again = UBLocalized.tr(UBLocalizedKey.wallet_scan_again_key)
  /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
   static let wallet_scanner_explanation = UBLocalized.tr(UBLocalizedKey.wallet_scanner_explanation_key)
  /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
   static let wallet_scanner_howitworks_answer1 = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_answer1_key)
  /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
   static let wallet_scanner_howitworks_external_link = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_external_link_key)
  /// Weitere Informationen
   static let wallet_scanner_howitworks_external_link_title = UBLocalized.tr(UBLocalizedKey.wallet_scanner_howitworks_external_link_title_key)
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
  /// Datum, Uhrzeit oder Zeitzone auf dem Gerät sind falsch eingestellt.
   static let wallet_time_inconsistency_error_text = UBLocalized.tr(UBLocalizedKey.wallet_time_inconsistency_error_text_key)
  /// Prüfung nicht möglich
   static let wallet_time_inconsistency_error_title = UBLocalized.tr(UBLocalizedKey.wallet_time_inconsistency_error_title_key)
  /// Transfer
   static let wallet_transfer_code_card_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_card_title_key)
  /// Ihr Transfer-Code wurde erstellt
   static let wallet_transfer_code_code_created_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_code_created_title_key)
  /// Transfer Code kopiert
   static let wallet_transfer_code_copied = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_copied_key)
  /// Code erstellen
   static let wallet_transfer_code_create_code_button = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_create_code_button_key)
  /// Erstellt am {DATE}
   static let wallet_transfer_code_createdat = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_createdat_key)
  /// Fertig
   static let wallet_transfer_code_done_button = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_done_button_key)
  /// Transfer-Code konnte nicht erstellt werden
   static let wallet_transfer_code_error_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_error_title_key)
  /// Noch {DAYS} Tage gültig
   static let wallet_transfer_code_expire_plural = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_expire_plural_key)
  /// {DAYS} Tage
   static let wallet_transfer_code_expire_plural_bold = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_expire_plural_bold_key)
  /// Noch 1 Tag gültig
   static let wallet_transfer_code_expire_singular = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_expire_singular_key)
  /// 1 Tag
   static let wallet_transfer_code_expire_singular_bold = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_expire_singular_bold_key)
  /// Wenn Sie einen Covid-Test machen (PCR-Test oder Antigen-Schnelltest), kann der Transfer-Code zur schnellen Übermittlung von Covid-Zertifikaten zum Einsatz kommen.\n\nInformieren Sie sich bei Ihrem Testcenter, in der Apotheke oder bei Ihrem Arzt, ob die Übermittlung per Transfer-Code angeboten wird.
   static let wallet_transfer_code_faq_questions_answer_1 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_answer_1_key)
  /// Aktuell ist die Übermittlung per Transfer-Code auf Covid-Tests ausgelegt. Wie Sie ein Covid-Zertifikat nach einer Impfung erhalten erfahren Sie hier:
   static let wallet_transfer_code_faq_questions_answer_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_answer_2_key)
  /// Falls die Stelle, die den Covid-Test durchführt, die Übermittlung per Transfer-Code anbietet, werden Sie bereits bei der Anmeldung oder der Testentnahme nach einem Transfer-Code gefragt.\n\nDen Transfer-Code können Sie in der «COVID Certificate»-App erstellen. Tippen Sie dazu auf dem Startbildschirm auf «Hinzufügen» resp. auf das «Plus»-Symbol unten rechts. Danach tippen Sie auf «Transfer-Code erstellen».\n\nDie App zeigt Ihnen einen 9-stelligen Code an. Diesen können Sie entweder bei der Anmeldung in ein Formular eintragen oder direkt bei der Testentnahme angeben.
   static let wallet_transfer_code_faq_questions_answer_3 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_answer_3_key)
  /// Nein, ein Transfer-Code kann nur einmal verwendet werden. Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie bitte für jedes Zertifikat einen neuen Code.
   static let wallet_transfer_code_faq_questions_answer_4 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_answer_4_key)
  /// Weitere Informationen
   static let wallet_transfer_code_faq_questions_linktext_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_linktext_2_key)
  /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
   static let wallet_transfer_code_faq_questions_linkurl_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_linkurl_2_key)
  /// Wer bietet die Übermittlung per Transfer-Code an?
   static let wallet_transfer_code_faq_questions_question_1 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_question_1_key)
  /// Können Transfer-Codes auch zur Übermittlung von Impfzertifikaten verwendet werden?
   static let wallet_transfer_code_faq_questions_question_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_question_2_key)
  /// Wie funktioniert die Übermittlung per Transfer-Code?
   static let wallet_transfer_code_faq_questions_question_3 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_question_3_key)
  /// Kann ich den Transfer-Code mehrmals benutzen?
   static let wallet_transfer_code_faq_questions_question_4 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_question_4_key)
  /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
   static let wallet_transfer_code_faq_questions_subtitle = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_subtitle_key)
  /// Covid-Zertifikate direkt in die App geliefert
   static let wallet_transfer_code_faq_questions_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_questions_title_key)
  /// Für den Transfer wird Ihr Covid-Zertifikat verschlüsselt bereitgestellt. Der Transfer-Code stellt sicher, dass nur Ihre App das Covid-Zertifikat empfangen kann. Unmittelbar nach dem Transfer werden die Daten wieder vom Server gelöscht.
   static let wallet_transfer_code_faq_works_answer_1 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_answer_1_key)
  /// Sobald das Zertifikat vom Labor oder Testcenter generiert wurde, steht es zum Transfer zur Verfügung. Stellen Sie sicher, dass Ihr Smartphone mit dem Internet verbunden ist, um Zertifikate empfangen zu können.\n\nSollte ihr Covid-Zertifikat dennoch nicht eintreffen, fragen Sie bei der Stelle nach, die den Test durchgeführt hat (Testcenter, Apotheke, Ärztin / Arzt).
   static let wallet_transfer_code_faq_works_answer_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_answer_2_key)
  /// Bei einem positiven Antigen-Schnelltest erhalten Sie vom Labor kein Covid-Zertifikat. \n\nBei einem positiven PCR-Test erhalten Sie ein Covid-Zertifikat für Genesene. Es ist ab dem 11. Tag nach der Testentnahme gültig.
   static let wallet_transfer_code_faq_works_answer_3 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_answer_3_key)
  /// Die App prüft regelmässig, ob ein Covid-Zertifikat für Ihren Transfer-Code verfügbar ist.
   static let wallet_transfer_code_faq_works_intro_1 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_intro_1_key)
  /// Sobald das Covid-Zertifikat verfügbar ist, erscheint es in der App. Wenn Sie Mitteilungen aktiviert haben, werden Sie von der App benachrichtigt.
   static let wallet_transfer_code_faq_works_intro_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_intro_2_key)
  /// Nach {TRANSFER_CODE_VALIDITY} Tagen läuft der Transfer-Code ab. Danach wartet die App noch für weitere 72h auf einen möglichen Transfer, bevor der Transfer-Code ungültig wird.
   static let wallet_transfer_code_faq_works_intro_3 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_intro_3_key)
  /// Wie sind meine Daten beim Transfer geschützt?
   static let wallet_transfer_code_faq_works_question_1 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_question_1_key)
  /// Was kann ich tun, wenn das Zertifikat nicht ankommt?
   static let wallet_transfer_code_faq_works_question_2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_question_2_key)
  /// Was passiert bei einem positiven Testresultat?
   static let wallet_transfer_code_faq_works_question_3 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_question_3_key)
  /// So funktioniert der Transfer
   static let wallet_transfer_code_faq_works_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_faq_works_title_key)
  /// Versuchen Sie es später erneut.
   static let wallet_transfer_code_generate_error_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_generate_error_text_key)
  /// Ein unerwarteter Fehler ist aufgetreten.
   static let wallet_transfer_code_generate_error_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_generate_error_title_key)
  /// Um einen Transfer-Code erstellen zu können, muss die App online sein.
   static let wallet_transfer_code_generate_no_internet_error_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_generate_no_internet_error_text_key)
  /// Nächste Schritte
   static let wallet_transfer_code_next_steps = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_next_steps_key)
  /// Übergeben Sie den Code bei der Testentnahme der Apotheke, dem Testcenter oder der Ärztin / dem Arzt.
   static let wallet_transfer_code_next_steps1 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_next_steps1_key)
  /// Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie für jedes Zertifikat einen neuen Code.
   static let wallet_transfer_code_next_steps2 = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_next_steps2_key)
  /// Keine Verbindung zum Internet
   static let wallet_transfer_code_no_internet_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_no_internet_title_key)
  /// Code abgelaufen
   static let wallet_transfer_code_old_code = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_old_code_key)
  /// Code erstellen
   static let wallet_transfer_code_onboarding_button = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_onboarding_button_key)
  /// So funktioniert's
   static let wallet_transfer_code_onboarding_howto = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_onboarding_howto_key)
  /// Sie können Transfer-Codes z. B. bei Covid-Tests angeben. Sie erhalten darauf das Covid-Zertifikat direkt in die App geliefert.
   static let wallet_transfer_code_onboarding_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_onboarding_text_key)
  /// Transfer Codes
   static let wallet_transfer_code_onboarding_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_onboarding_title_key)
  /// Transfer fehlgeschlagen
   static let wallet_transfer_code_state_expired = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_state_expired_key)
  /// Mit diesem Transfer kann kein Zertifikat mehr empfangen werden.
   static let wallet_transfer_code_state_no_certificate = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_state_no_certificate_key)
  /// Zuletzt aktualisiert\n{DATE}
   static let wallet_transfer_code_state_updated = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_state_updated_key)
  /// Warten auf Transfer
   static let wallet_transfer_code_state_waiting = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_state_waiting_key)
  /// Die Uhrzeit muss richtig eingestellt sein, damit Transfer-Codes funktionieren. Passen Sie Ihre Uhrzeit an und versuchen sie es erneut.
   static let wallet_transfer_code_time_inconsistency_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_time_inconsistency_text_key)
  /// Uhrzeit Fehler
   static let wallet_transfer_code_time_inconsistency_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_time_inconsistency_title_key)
  /// Transfer-Code
   static let wallet_transfer_code_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_title_key)
  /// +41 58 466 07 99
   static let wallet_transfer_code_unexpected_error_phone_number = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_unexpected_error_phone_number_key)
  /// Kontaktieren Sie den Support
   static let wallet_transfer_code_unexpected_error_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_unexpected_error_text_key)
  /// Unerwarteter Fehler
   static let wallet_transfer_code_unexpected_error_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_unexpected_error_title_key)
  /// Aktualisierung zur Zeit nicht möglich
   static let wallet_transfer_code_update_error_title = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_update_error_title_key)
  /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
   static let wallet_transfer_code_update_general_error_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_update_general_error_text_key)
  /// Um den Transfer empfangen zu können, muss die App online sein.
   static let wallet_transfer_code_update_no_internet_error_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_code_update_no_internet_error_text_key)
  /// Wollen Sie den Transfer-Code wirklich löschen?
   static let wallet_transfer_delete_confirm_text = UBLocalized.tr(UBLocalizedKey.wallet_transfer_delete_confirm_text_key)
  /// Mit diesem Update können Sie in der App eine Zertifikatskopie ohne Gesundheitsdaten für die Verwendung in der Schweiz generieren lassen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
   static let wallet_update_boarding_certificate_light_text = UBLocalized.tr(UBLocalizedKey.wallet_update_boarding_certificate_light_text_key)
  /// Zertifikat Light
   static let wallet_update_boarding_certificate_light_title = UBLocalized.tr(UBLocalizedKey.wallet_update_boarding_certificate_light_title_key)
  /// Update
   static let wallet_update_boarding_header = UBLocalized.tr(UBLocalizedKey.wallet_update_boarding_header_key)
  /// UVCI kopiert
   static let wallet_uvci_copied = UBLocalized.tr(UBLocalizedKey.wallet_uvci_copied_key)
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
