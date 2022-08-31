// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
 enum UBLocalized {
   enum Key : String {
    /// Zertifikat hinzufügen
     case accessibility_add_button
    /// Schliessen
     case accessibility_close_button
    /// erweitert
     case accessibility_expandable_box_expanded_state
    /// reduziert
     case accessibility_expandable_box_reduced_state
    /// Häufige Fragen
     case accessibility_faq_button
    /// Information
     case accessibility_info_box
    /// Impressum
     case accessibility_info_button
    /// Taschenlampe ausschalten
     case accessibility_lamp_off_button
    /// Taschenlampe einschalten
     case accessibility_lamp_on_button
    /// Zertifikate Liste
     case accessibility_list_button
    /// QR-Code
     case accessibility_qr_code
    /// Aktualisieren
     case accessibility_refresh_button
    /// Zugriff auf Kamera erlauben
     case camera_permission_dialog_action
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
     case camera_permission_dialog_text
    /// Abbrechen
     case cancel_button
    /// Was bedeutet das?
     case cert_renewal_info_expired_heading
    /// Die QR-Codes der Covid-Zertifikate sind technisch nur begrenzt gültig.
     case cert_renewal_info_expired_text_1
    /// Damit dieses Zertifikat (z. B. auf Reisen) weiterhin geprüft werden kann, muss der QR-Code erneuert werden.
     case cert_renewal_info_expired_text_2
    /// Die Erneuerung können Sie hier in der App selbst durchführen (Internetverbindung nötig). Die Daten des aktuellen Zertifikats werden dazu verschlüsselt von der App an das System des Bundes zur Ausstellung von Covid-Zertifikaten übermittelt. Danach wird ein neuer QR-Code zurück an die App gesendet. Anschliessend werden die Daten gelöscht.
     case cert_renewal_info_expired_text_3
    /// Erneuern Sie den QR-Code auch dann, wenn die Gültigkeit in der Schweiz bald abläuft oder bereits abgelaufen ist.
     case cert_renewal_info_expired_text_4
    /// Was bedeutet das?
     case cert_renewal_info_info_heading
    /// Die QR-Codes der Covid-Zertifikate sind technisch nur begrenzt gültig.
     case cert_renewal_info_info_text_1
    /// Damit dieses Zertifikat (z. B. auf Reisen) weiterhin geprüft werden kann, muss der QR-Code erneuert werden.
     case cert_renewal_info_info_text_2
    /// Die Erneuerung können Sie hier in der App selbst durchführen (Internetverbindung nötig). Die Daten des aktuellen Zertifikats werden dazu verschlüsselt von der App an das System des Bundes zur Ausstellung von Covid-Zertifikaten übermittelt. Danach wird ein neuer QR-Code zurück an die App gesendet. Anschliessend werden die Daten gelöscht.
     case cert_renewal_info_info_text_3
    /// Wieso Sie den QR-Code auch dann erneuern sollten, wenn Ihr Impf- oder Genesungszertifikat nach den Schweizer Gültigkeitsregeln bald abläuft oder bereits abgelaufen ist, lesen Sie in dieser FAQ.
     case cert_renewal_info_info_text_4
    /// Wichtig!
     case cert_renewal_info_renewed_heading
    /// Ersetzen Sie auch zuvor ausgedruckte oder gespeicherte Zertifikate durch diese erneuerte Version.
     case cert_renewal_info_renewed_text_1
    /// Wie lange ein Covid-Zertifikat gültig ist wird in jedem Land gemäss den aktuell geltenden Regeln berechnet. Die Erneuerung des QR-Codes hat darauf keinen Einfluss.
     case cert_renewal_info_renewed_text_2
    /// Genesen
     case certificate_reason_recovered
    /// Test
     case certificate_reason_tested
    /// Impfung
     case certificate_reason_vaccinated
    /// Schliessen
     case close_button
    /// Weiter
     case continue_button
    /// Genesung (Antigen-Schnelltest)
     case covid_certificate_antigen_positive_test
    /// Ausnahme
     case covid_certificate_ch_ausnahme_list_label
    /// Ausnahmezertifikat
     case covid_certificate_ch_ausnahme_test_title
    /// Genesung
     case covid_certificate_recovery_title
    /// Befund
     case covid_certificate_sero_positiv_test_befund_label
    /// Genügend
     case covid_certificate_sero_positiv_test_befund_value
    /// Genesung (Antikörper)
     case covid_certificate_sero_positiv_test_title
    /// Test
     case covid_certificate_test_title
    /// Covid-Zertifikat
     case covid_certificate_title
    /// Impfung
     case covid_certificate_vaccination_title
    /// Löschen
     case delete_button
    /// Einstellungen ändern
     case error_action_change_settings
    /// Erneut versuchen
     case error_action_retry
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
     case error_camera_permission_text
    /// Kein Zugriff auf Kamera
     case error_camera_permission_title
    /// Ein Speicher der App konnte nicht entschlüsselt werden. Um die App weiter zu benutzen muss der Speicher gelöscht und neu erstellt werden. Dabei gehen Daten verloren.
     case error_corrupt_sharedprefs_text
    /// Entschlüsselungsfehler
     case error_corrupt_sharedprefs_title
    /// Zurücksetzen
     case error_decryption_reset_button
    /// Zertifikate konnten nicht geladen werden\n\nCode: {ERROR_CODE}
     case error_decryption_text
    /// Die Datei enthält entweder keinen gültigen QR-Code oder der QR-Code konnte nicht erkannt werden.
     case error_file_import_text
    /// Import fehlgeschlagen
     case error_file_import_title
    /// Überprüfen Sie Ihre Internet Verbindung.
     case error_network_text
    /// Netzwerkfehler
     case error_network_title
    /// Fehler
     case error_title
    /// Aktualisieren
     case force_update_button
    /// Laden Sie die neue Version der App.
     case force_update_text
    /// Update benötigt
     case force_update_title
    /// Impressum
     case impressum_title
    /// Mehr erfahren
     case infobox_generic_button
    /// Wenn Sie die App löschen, Ihr Smartphone wechseln oder verlieren, gehen auch Ihre Covid-Zertifikate verloren.\nBewahren Sie Ihre Zertifikate daher auch ausserhalb der App auf, indem Sie diese als PDF exportieren.
     case infobox_generic_text
    /// Zertifikat sichern!
     case infobox_generic_title
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/ich-habe-das-covid-zertifikat-ausschliesslich-elektronisch-der-covid-certificate
     case infobox_generic_url_android
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/ich-habe-das-covid-zertifikat-ausschliesslich-elektronisch-der-covid-certificate
     case infobox_generic_url_ios
    /// Aktualisieren
     case infobox_update_button
    /// Laden Sie die neue Version der App.
     case infobox_update_text
    /// Neue Version verfügbar
     case infobox_update_title
    /// Einstellungen
     case ios_settings_open
    /// de
     case language_key
    /// Sprache
     case language_title
    /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
     case NSCameraUsageDescription
    /// OK
     case ok_button
    /// Kein gültiger Code
     case qr_scanner_error
    /// Zum Formular
     case rat_conversion_form_button
    /// Ich bin einverstanden, dass die Daten dieses Covid-Zertifikats in das Formular der Nationalen Antragsstelle (eine Website des Bundes) übertragen werden.
     case rat_conversion_form_text
    /// Zum Online-Formular der Nationalen Antragsstelle
     case rat_conversion_form_title
    /// Ist die Beantragung erfolgreich, wird Ihnen das neue EU-kompatible Covid-Zertifikat per Post zugestellt und kann von Ihnen in die App übernommen werden. Eine direkte Zustellung in die App ist nicht möglich.
     case rat_conversion_info1_text
    /// Durch die Übernahme der Daten des Zertifikats in das Online-Formular kann Ihr Antrag einfacher verarbeitet werden.
     case rat_conversion_info2_text
    /// Weitere Informationen
     case rat_conversion_info_title
    /// Website der Nationalen Antragsstelle (ohne Datenübernahme)
     case rat_conversion_link_antragsstelle
    /// Mehr erfahren
     case rat_conversion_overview_button
    /// Für dieses Covid-Zertifikat kann eine EU-kompatible Version beantragt werden.
     case rat_conversion_overview_text
    /// Neu: EU-kompatible Version
     case rat_conversion_overview_title
    /// Neu werden Covid-Zertifikate für Genesene auf Basis von Antigen-Schnelltests auch in der EU akzeptiert.\n\nSie haben die Möglichkeit, eine EU-kompatible Version dieses Zertifikats bei der Nationalen Antragsstelle zu beantragen.
     case rat_conversion_text
    /// Covid-Zertifikat beantragen (EU-kompatibel)
     case rat_conversion_title
    /// Einstellungen
     case settings_title
    /// Covid-19
     case target_disease_name
    /// Die Nutzungsbedingungen und die Datenschutzerklärung der App wurden punktuell aktualisiert und an die rechtlichen Grundlagen angepasst.
     case terms_and_conditions_update_boarding_text
    /// Aktualisierung
     case terms_and_conditions_update_boarding_title
    /// Ein unbekannter Fehler ist aufgetreten.
     case unknown_error
    /// Impftermin
     case vaccination_appointment_header
    /// Aargau
     case vaccination_booking_ag_name
    /// https://www.ag.ch/coronavirus-impfung
     case vaccination_booking_ag_url
    /// Appenzell Innerrhoden
     case vaccination_booking_ai_name
    /// https://www.ai.ch/coronavirus-impfung
     case vaccination_booking_ai_url
    /// Appenzell Ausserrhoden
     case vaccination_booking_ar_name
    /// https://www.ar.ch/verwaltung/departement-gesundheit-und-soziales/amt-fuer-gesundheit/informationsseite-coronavirus/coronaimpfung/
     case vaccination_booking_ar_url
    /// Bern
     case vaccination_booking_be_name
    /// http://www.be.ch/corona-impfung
     case vaccination_booking_be_url
    /// Basel-Landschaft
     case vaccination_booking_bl_name
    /// https://www.bl.ch/impfen
     case vaccination_booking_bl_url
    /// Basel-Stadt
     case vaccination_booking_bs_name
    /// http://www.coronaimpfzentrumbasel.ch
     case vaccination_booking_bs_url
    /// Freiburg
     case vaccination_booking_fr_name
    /// https://www.fr.ch/de/gesundheit/covid-19/covid-19-impfung-in-ihrer-naehe-durch-impfteams-in-den-impfzentren-in-der-apotheke-oder-bei-ihrem-arzt
     case vaccination_booking_fr_url
    /// Genf
     case vaccination_booking_ge_name
    /// https://www.ge.ch/se-faire-vacciner-contre-covid-19
     case vaccination_booking_ge_url
    /// Glarus
     case vaccination_booking_gl_name
    /// https://www.gl.ch/verwaltung/finanzen-und-gesundheit/gesundheit/coronavirus.html/4817#Impfung
     case vaccination_booking_gl_url
    /// Graubünden
     case vaccination_booking_gr_name
    /// https://www.gr.ch/DE/institutionen/verwaltung/djsg/ga/coronavirus/info/impfen/Seiten/impfen.aspx
     case vaccination_booking_gr_url
    /// Die Covid-19-Impfung ist für Personen ab 5 Jahren empfohlen.
     case vaccination_booking_info_info
    /// Eine Impfung könnte zum Beispiel an diesen Orten in Ihrer Nähe stattfinden:\n\n- in spezifischen Impfzentren\n- in Spitälern\n- bei Ihrem Hausarzt oder Ihrer Hausärztin\n- in Impfapotheken\n\nViele Orte bieten auch Walk-in-Impfungen ohne Termine an.
     case vaccination_booking_info_text
    /// Impftermin in Ihrer Nähe buchen
     case vaccination_booking_info_title
    /// https://bag-coronavirus.ch/impfung/
     case vaccination_booking_info_url
    /// Jura
     case vaccination_booking_ju_name
    /// https://www.jura.ch/fr/Autorites/Coronavirus/Vaccination.html
     case vaccination_booking_ju_url
    /// Luzern
     case vaccination_booking_lu_name
    /// http://www.lu.ch/covid_impfung
     case vaccination_booking_lu_url
    /// Neuenburg
     case vaccination_booking_ne_name
    /// https://www.ne.ch/autorites/DFS/SCSP/medecin-cantonal/maladies-vaccinations/covid-19-vaccination/Pages/accueil.aspx
     case vaccination_booking_ne_url
    /// Nidwalden
     case vaccination_booking_nw_name
    /// https://www.nw.ch/gesundheitsamtdienste/6044#Impfung
     case vaccination_booking_nw_url
    /// Obwalden
     case vaccination_booking_ow_name
    /// https://www.ow.ch/dienstleistungen/7129
     case vaccination_booking_ow_url
    /// St. Gallen
     case vaccination_booking_sg_name
    /// https://www.sg.ch/coronavirus/impfen
     case vaccination_booking_sg_url
    /// Schaffhausen
     case vaccination_booking_sh_name
    /// https://sh.ch/CMS/Webseite/Kanton-Schaffhausen/Beh-rde/Verwaltung/Departement-des-Innern/Gesundheitsamt-7126057-DE.html
     case vaccination_booking_sh_url
    /// Solothurn
     case vaccination_booking_so_name
    /// https://so.ch/coronaimpfung
     case vaccination_booking_so_url
    /// Schwyz
     case vaccination_booking_sz_name
    /// https://www.sz.ch/corona-impfen
     case vaccination_booking_sz_url
    /// Thurgau
     case vaccination_booking_tg_name
    /// https://gesundheit.tg.ch/aktuelles/impfung-fuer-covid-19.html/11590
     case vaccination_booking_tg_url
    /// Tessin
     case vaccination_booking_ti_name
    /// http://www.ti.ch/vaccinazione
     case vaccination_booking_ti_url
    /// Uri
     case vaccination_booking_ur_name
    /// https://www.ur.ch/themen/3673
     case vaccination_booking_ur_url
    /// Waadt
     case vaccination_booking_vd_name
    /// https://vd.ch/coronavirus-vaccins
     case vaccination_booking_vd_url
    /// Wallis
     case vaccination_booking_vs_name
    /// https://www.vs.ch/de/web/coronavirus#ancre_vaccination
     case vaccination_booking_vs_url
    /// Zug
     case vaccination_booking_zg_name
    /// https://www.corona-impfung-zug.ch/
     case vaccination_booking_zg_url
    /// Zürich
     case vaccination_booking_zh_name
    /// http://www.zh.ch/coronaimpfung
     case vaccination_booking_zh_url
    /// Wählen Sie Ihren Kanton
     case vaccination_choose_your_canton
    /// Mit der Covid-19-Impfung können Sie unbeschwert in die meisten Länder reisen.
     case vaccination_hint_text_2
    /// Mit der Covid-19-Impfung können Sie sich vor Erkrankung und einem allfälligen schweren Verlauf schützen.
     case vaccination_hint_text_3
    /// Mit der Covid-19-Impfung können Sie auf sichere Art immun werden.
     case vaccination_hint_text_4
    /// Mit der Covid-19-Impfung können Sie mithelfen, die Krankheitslast zu reduzieren.
     case vaccination_hint_text_5
    /// Mit der Covid-19-Impfung können Sie helfen, die Auswirkungen der Pandemie zu bekämpfen.
     case vaccination_hint_text_6
    /// Mit der Covid-19-Impfung können Sie die Langzeitfolgen einer Covid-19-Erkrankung vermeiden.
     case vaccination_hint_text_7
    /// Mit der Covid-19-Impfung können Sie dazu beitragen, das Gesundheitswesen zu entlasten.
     case vaccination_hint_text_8
    /// Jetzt impfen lassen!
     case vaccination_hint_title_2
    /// Jetzt impfen lassen!
     case vaccination_hint_title_3
    /// Jetzt impfen lassen!
     case vaccination_hint_title_4
    /// Jetzt impfen lassen!
     case vaccination_hint_title_5
    /// Jetzt impfen lassen!
     case vaccination_hint_title_6
    /// Jetzt impfen lassen!
     case vaccination_hint_title_7
    /// Jetzt impfen lassen!
     case vaccination_hint_title_8
    /// Impftermin buchen
     case vaccination_homescreen_button_title
    /// Zum Impf-Check
     case vaccination_impf_check_action
    /// Der Covid-19 Impf-Check gibt Auskunft über Erst- sowie Auffrischimpfungen und führt Sie zur entsprechenden Anlaufstelle in Ihrem Kanton.
     case vaccination_impf_check_info_text
    /// Jetzt Termin buchen
     case vaccination_impf_check_title
    /// https://covid19.impf-check.ch/
     case vaccination_impf_check_url
    /// Informationen zur Impfung
     case vaccination_information_button_in_certificate
    /// Weitere Informationen rund um die Covid-19-Impfung
     case vaccination_more_information_title
    /// Für 2G+ nur in Kombination mit der Prüfung eines Covid-Zertifikats für Geimpfte oder Genesene zugelassen.
     case verifier_2g_plus_info2g
    /// Für 2G+ nur in Kombination mit der Prüfung eines gültigen Testzertifikats zugelassen.
     case verifier_2g_plus_infoplus
    /// Gültiges Covid-Zertifikat nach 2G-Regelung
     case verifier_2g_plus_success2g
    /// Gültiges Covid-Zertifikat für Getestete
     case verifier_2g_plus_successplus
    /// market://details?id=ch.admin.bag.covidcertificate.verifier
     case verifier_android_app_google_play_store_url
    /// Covid Check
     case verifier_app_name
    /// COVID Certificate Check
     case verifier_app_title
    /// http://itunes.apple.com/app/id1565917510
     case verifier_apple_app_store_url
    /// Gültigkeit des Zertifikats\nabgelaufen
     case verifier_certificate_light_error_expired
    /// Für Betriebe und Veranstaltungen, in welchen mit einer Regelung nach 2G+ geprüft wird.
     case verifier_check_mode_info_2g_plus_text_1
    /// Zusätzlich zu einem Covid-Zertifikat für Geimpfte oder Genesene wird ein gültiges Testzertifikat benötigt, welches separat geprüft werden muss.
     case verifier_check_mode_info_2g_plus_text_2
    /// Ausnahmen: Personen, deren vollständige Impfung, Auffrischimpfung oder Genesung nicht länger als 120 Tage zurückliegt.
     case verifier_check_mode_info_2g_plus_text_3
    /// Die Prüfung von Zertifikate Light ist in diesem Modus nicht möglich.
     case verifier_check_mode_info_2g_plus_text_4
    /// 2G+
     case verifier_check_mode_info_2g_plus_title
    /// Für Betriebe und Veranstaltungen, in welchen mit einer 2G-Regelung geprüft wird.
     case verifier_check_mode_info_2g_text_1
    /// In diesem Modus werden Covid-Zertifikate für Geimpfte oder Genesene akzeptiert.
     case verifier_check_mode_info_2g_text_2
    /// Die Prüfung von einem Zertifikat Light ist in diesem Modus nicht möglich.
     case verifier_check_mode_info_2g_text_3
    /// 2G
     case verifier_check_mode_info_2g_title
    /// Für Betriebe und Veranstaltungen, in welchen mit einer 3G-Regelung geprüft wird.
     case verifier_check_mode_info_3g_text_1
    /// In diesem Modus werden Covid-Zertifikate für Geimpfte, Genesene oder negativ Getestete akzeptiert.
     case verifier_check_mode_info_3g_text_2
    /// Die Prüfung von einem Zertifikat Light ist in diesem Modus möglich.
     case verifier_check_mode_info_3g_text_3
    /// 3G
     case verifier_check_mode_info_3g_title
    /// Für Bereiche, bei denen ein gültiges Testzertifikat notwendig ist.
     case verifier_check_mode_info_test_cert_text_1
    /// In diesem Modus werden Covid-Zertifikate für negativ Getestete basierend auf einem PCR- oder Antigen-Schnelltest akzeptiert.
     case verifier_check_mode_info_test_cert_text_2
    /// Die Prüfung von Zertifikate Light ist in diesem Modus nicht möglich.
     case verifier_check_mode_info_test_cert_text_3
    /// Testzertifikat
     case verifier_check_mode_info_test_cert_title
    /// Wählen Sie den Prüfmodus, in welchem Sie Covid-Zertifikate prüfen möchten.
     case verifier_check_mode_info_unselected_text_1
    /// Der Prüfmodus kann jederzeit geändert werden.
     case verifier_check_mode_info_unselected_text_2
    /// wählen
     case verifier_choose_mode_button_title
    /// Geburtsdatum
     case verifier_covid_certificate_birthdate
    /// Nachname
     case verifier_covid_certificate_name
    /// Vorname
     case verifier_covid_certificate_prename
    /// Zum App Store
     case verifier_error_app_store_button
    /// Die Prüfung dieser Art des Covid-Zertifikats bedingt die neuste Version der Check-App. Bitte aktualisieren Sie Ihre App und wiederholen Sie den Prüfvorgang.
     case verifier_error_app_store_text
    /// Das Format des Covid-Zertifikats ist ungültig.
     case verifier_error_invalid_format
    /// Ihr gewählter Prüfmodus existiert nicht mehr.
     case verifier_error_mode_no_longer_exists
    /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App mit der dafür vorgesehenen COVID Certificate Check App.
     case verifier_faq_works_answer_1
    /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
     case verifier_faq_works_answer_2
    /// Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
     case verifier_faq_works_answer_2_1
    /// Neben Pass oder ID werden auch andere Ausweisdokumente akzeptiert, die die Identität der betreffenden Person mit einem Foto belegen (z.B. Führerausweis). Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
     case verifier_faq_works_answer_3
    /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
     case verifier_faq_works_answer_4
    /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum der Zertifikatsinhaberin oder des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
     case verifier_faq_works_answer_5
    /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
     case verifier_faq_works_answer_6
    /// Grundsätzlich können Covid-Zertifikate auch ohne eine Internetverbindung geprüft werden. Dazu werden regelmässig aktualisierte Prüflisten von einem zentralen Server heruntergeladen. Diese lokal gespeicherten Prüflisten dürfen nicht älter als 48h sein. \n\nUm die Prüflisten zu aktualisieren muss die App mit dem Internet verbunden sein und geöffnet werden. Die Aktualisierung erfolgt unmittelbar und automatisch.
     case verifier_faq_works_answer_7
    /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
     case verifier_faq_works_answer_8
    /// Das Zertifikat Light kann durch die Halterin / den Halter jederzeit in der «COVID Certificate»-App deaktiviert werden. Danach steht das normale Covid-Zertifikat wieder zur Verfügung.
     case verifier_faq_works_answer_9
    /// Erklärvideo
     case verifier_faq_works_linktext_1
    /// Weitere Informationen
     case verifier_faq_works_linktext_2_1
    /// https://youtu.be/DClLZIUjr3w
     case verifier_faq_works_linkurl_1
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/covid-zertifikat.html#-837133624
     case verifier_faq_works_linkurl_2_1
    /// Wie können Covid-Zertifikate geprüft werden?
     case verifier_faq_works_question_1
    /// Was wird genau geprüft?
     case verifier_faq_works_question_2
    /// Was sind die aktuellen Gültigkeitskriterien der Schweiz?
     case verifier_faq_works_question_2_1
    /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
     case verifier_faq_works_question_3
    /// Können auch ausländische Zertifikate geprüft werden?
     case verifier_faq_works_question_4
    /// Welche Daten sehe ich beim Prüfvorgang?
     case verifier_faq_works_question_5
    /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
     case verifier_faq_works_question_6
    /// Können Zertifikate auch offline geprüft werden?
     case verifier_faq_works_question_7
    /// Was ist das Zertifikat Light?
     case verifier_faq_works_question_8
    /// Wie kann ein Zertifikat Light wieder in ein EU/EFTA-konformes Covid-Zertifikat umgewandelt werden?
     case verifier_faq_works_question_9
    /// Mit der COVID Certificate Check App können QR-Codes auf Covid-Zertifikaten gescannt und die Zertifikate auf Echtheit und Gültigkeit überprüft werden.
     case verifier_faq_works_subtitle
    /// So werden Covid-Zertifikate geprüft
     case verifier_faq_works_title
    /// Covid Certificate
     case verifier_homescreen_header_title
    /// Vorgewiesenes Zertifikat scannen
     case verifier_homescreen_pager_description_1
    /// Zertifikate werden automatisch geprüft
     case verifier_homescreen_pager_description_2
    /// Prüfen
     case verifier_homescreen_scan_button
    /// Prüfen ({MODE})
     case verifier_homescreen_scan_button_with_mode
    /// So funktioniert's
     case verifier_homescreen_support_button
    /// Check
     case verifier_homescreen_title
    /// Prüfmodus
     case verifier_mode_title
    /// Ein unerwarteter Fehler ist aufgetreten.
     case verifier_network_error_text
    /// Prüfung fehlgeschlagen
     case verifier_network_error_title
    /// Eine Internetverbindung wird benötigt, um die Prüflisten zu aktualisieren
     case verifier_offline_error_text
    /// Offline-Prüfung nicht möglich
     case verifier_offline_error_title
    /// Externer Hardwarescanner erkannt
     case verifier_qr_scanner_external_hardware_detected
    /// QR-Code scannen\nzum Prüfen
     case verifier_qr_scanner_scan_qr_text
    /// Das Gerät befindet sich im Flugmodus.
     case verifier_retry_flightmode_error
    /// Ein Netzwerkfehler ist aufgetreten.
     case verifier_retry_network_error
    /// So funktioniert's
     case verifier_support_header
    /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-check-app.html
     case verifier_terms_privacy_link
    /// Prüfen
     case verifier_title_qr_scan
    /// Mit diesem Update können Sie in der App auch die Zertifikatskopie ohne Gesundheitsdaten prüfen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
     case verifier_update_boarding_certificate_light_text
    /// Zertifikat Light
     case verifier_update_boarding_certificate_light_title
    /// Update
     case verifier_update_boarding_header
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDie Gültigkeit des Zertifikat ist abgelaufen.
     case verifier_verifiy_error_expired
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDas Zertifikat ist noch nicht gültig.
     case verifier_verifiy_error_notyetvalid
    /// Das Covid-Zertifikat wurde widerrufen
     case verifier_verify_error_info_for_blacklist
    /// Das Covid-Zertifikat hat keine gültige Signatur
     case verifier_verify_error_info_for_certificate_invalid
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz oder des Prüfmodus ({MODUS})
     case verifier_verify_error_info_for_national_rules
    /// Ein unerwarteter Fehler ist aufgetreten.
     case verifier_verify_error_list_info_text
    /// Prüfung fehlgeschlagen
     case verifier_verify_error_list_title
    /// Covid-Zertifikat ungültig
     case verifier_verify_error_title
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz.
     case verifier_verify_error_validity_range_bold
    /// Die Prüfung kann in diesem Fall nur erfolgen, wenn die Umwandlung in ein Zertifikat Light rückgängig gemacht wird.
     case verifier_verify_light_not_supported_by_mode_text
    /// Beim zu prüfenden Covid-Zertifikat handelt es sich um ein Zertifikat Light. Dies kann im {MODUS}-Prüfmodus nicht geprüft werden.
     case verifier_verify_light_not_supported_by_mode_title
    /// Zertifikat wird geprüft
     case verifier_verify_loading_text
    /// Nur mit einem Ausweisdokument \n& innerhalb der Schweiz gültig
     case verifier_verify_success_certificate_light_info
    /// Nur mit einem \nAusweisdokument gültig
     case verifier_verify_success_info
    /// Nicht widerrufen
     case verifier_verify_success_info_for_blacklist
    /// Signatur gültig
     case verifier_verify_success_info_for_certificate_valid
    /// Prüfung erfolgreich
     case verifier_verify_success_title
    /// Noch {TIMESPAN} gültig
     case wallet_accessibility_light_certificate_expiration_timer
    /// Hinzufügen
     case wallet_add_certificate
    /// Hinzufügen
     case wallet_add_certificate_button
    /// market://details?id=ch.admin.bag.covidcertificate.wallet
     case wallet_android_app_google_play_store_url
    /// Covid Cert
     case wallet_app_name
    /// http://itunes.apple.com/app/id1565917320
     case wallet_apple_app_store_url
    /// Covid-Zertifikat
     case wallet_certificate
    /// Dieses Zertifikat ist bereits in der App gespeichert
     case wallet_certificate_already_exists
    /// Datum des ersten positiven Resultats
     case wallet_certificate_antigen_positive_date
    /// Medizinisches Attest ausgestellt in
     case wallet_certificate_ausnahme_issued_country
    /// Für die Ausstellung verantwortliche Stelle
     case wallet_certificate_ausnahme_responsible_issuer
    /// Beginn der Gültigkeit
     case wallet_certificate_ausnahme_test_attest_start_date
    /// Zertifikat erstellt am\n{DATE}
     case wallet_certificate_date
    /// Wollen Sie das Zertifikat wirklich löschen?
     case wallet_certificate_delete_confirm_text
    /// Zertifikat Light
     case wallet_certificate_detail_certificate_light_button
    /// Date format used: dd.mm.yyyy
     case wallet_certificate_detail_date_format_info
    /// Exportieren
     case wallet_certificate_detail_export_button
    /// Dieses Zertifikat ist kein Reisedokument. \n<br /><br />\nDie wissenschaftlichen Erkenntnisse über Covid-19-Impfungen und -Tests sowie über die Genesung von einer Covid-19-Infektion entwickeln sich ständig weiter, auch im Hinblick auf neue besorgniserregende Virusvarianten. \n<br /><br />\nBitte informieren Sie sich vor einer Reise über die am Zielort geltenden Beschränkungen und Gültigkeitsregeln. Die Gültigkeit Ihres Zertifikats wird im Ausland anhand der Regeln des Ziellandes berechnet. Diese kann von der in der «COVID Certificate»-App angegebenen Schweizer Gültigkeit abweichen. Mehr Informationen dazu erhalten Sie <a href="https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/was-soll-ich-tun-wenn-mein-covid-zertifikat-nach-schweizer-gueltigkeitsregeln-bald">in dieser FAQ</a>.
     case wallet_certificate_detail_note
    /// Dieses Zertifikat ist kein Reisedokument. \n<br /><br />\nDieses Zertifikat ist zeitlich nur begrenzt gültig. Die aktuell in der Schweiz massgebliche Gültigkeitsdauer können Sie jederzeit mit der Covid-Certificate App überprüfen.
     case wallet_certificate_detail_note_ausnahme
    /// Dieses Zertifikat ist kein Reisedokument.\n<br /><br />\nDieses Zertifikat ist zeitlich nur begrenzt gültig. Die aktuell in der Schweiz massgebliche Gültigkeitsdauer können Sie jederzeit mit der Covid-Certificate App überprüfen.
     case wallet_certificate_detail_note_positive_antigen
    /// Nachweis erstellt am\n{DATE}
     case wallet_certificate_evidence_creation_date
    /// Nachweis
     case wallet_certificate_evidence_title
    /// Exportieren
     case wallet_certificate_export_button
    /// PDF konnte nicht\nerstellt werden
     case wallet_certificate_export_detail_error_title
    /// Exportieren
     case wallet_certificate_export_detail_export_button
    /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
     case wallet_certificate_export_detail_general_error_text
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_certificate_export_detail_general_error_title
    /// Um das PDF erstellen zu können, muss die App online sein.
     case wallet_certificate_export_detail_network_error_text
    /// Keine Verbindung zum Internet
     case wallet_certificate_export_detail_network_error_title
    /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
     case wallet_certificate_export_detail_summary_1
    /// Die Erstellung des PDF-Dokuments erfolgt online.
     case wallet_certificate_export_detail_summary_2
    /// Exportieren
     case wallet_certificate_export_detail_title
    /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
     case wallet_certificate_export_summary_1
    /// Die Erstellung des PDF-Dokuments erfolgt online.
     case wallet_certificate_export_summary_2
    /// Covid-Zertifikat exportieren
     case wallet_certificate_export_title
    /// UVCI
     case wallet_certificate_identifier
    /// Impfdosis
     case wallet_certificate_impfdosis_title
    /// Hersteller
     case wallet_certificate_impfstoff_holder
    /// Produkt
     case wallet_certificate_impfstoff_product_name_title
    /// Aktivieren
     case wallet_certificate_light_detail_activate_button
    /// Zertifikat Light\nkonnte nicht aktiviert werden
     case wallet_certificate_light_detail_activation_error
    /// Versuchen Sie es später erneut.
     case wallet_certificate_light_detail_activation_general_error_text
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_certificate_light_detail_activation_general_error_title
    /// Um das Zertifikat Light aktivieren zu können, muss die App online sein.
     case wallet_certificate_light_detail_activation_network_error_text
    /// Keine Verbindung zum Internet
     case wallet_certificate_light_detail_activation_network_error_title
    /// Deaktivieren
     case wallet_certificate_light_detail_deactivate_button
    /// Kann nur innerhalb der Schweiz verwendet werden
     case wallet_certificate_light_detail_summary_1
    /// Enthält nur Namen, Vornamen, Geburtsdatum und eine elektronische Signatur
     case wallet_certificate_light_detail_summary_2
    /// Gültig für max. {LIGHT_CERT_VALIDITY_IN_H} Stunden
     case wallet_certificate_light_detail_summary_3
    /// Die Konvertierung des Covid-Zertifikats in ein Zertifikat Light erfolgt online.
     case wallet_certificate_light_detail_summary_4
    /// Sie können das Zertifikat Light jederzeit deaktivieren, um wieder zum normalen Covid-Zertifikat zu wechseln.
     case wallet_certificate_light_detail_summary_5
    /// Zertifikat Light
     case wallet_certificate_light_detail_summary_title
    /// Wenn Sie das Zertifikat Light aktivieren, wird aus den Daten Ihres Covid-Zertifikats ein neuer QR-Code erstellt, der keine Gesundheitsdaten enthält.
     case wallet_certificate_light_detail_text_1
    /// Während das normale Covid-Zertifikat im Rahmen seiner Gültigkeit ohne Einschränkungen sowohl in der Schweiz als auch in der EU/EFTA verwendet werden kann, ist der Einsatz des Zertifikats Light nur in der Schweiz möglich. Aus Datenschutzgründen muss das Zertifikat Light nach {LIGHT_CERT_VALIDITY_IN_H} Stunden erneut aktiviert werden. Es bringt keine zusätzlichen Rechte gegenüber dem normalen Covid-Zertifikat.
     case wallet_certificate_light_detail_text_2
    /// nur muss keine
     case wallet_certificate_light_detail_text_2_bold
    /// Was ist ein \nZertifikat Light?
     case wallet_certificate_light_detail_title
    /// Das Zertifikat Light wurde in den letzten 24h bereits zu oft aktiviert.
     case wallet_certificate_light_rate_limit_text
    /// 24h-Limite erreicht
     case wallet_certificate_light_rate_limit_title
    /// Zertifikat Light
     case wallet_certificate_light_title
    /// Light
     case wallet_certificate_list_light_certificate_badge
    /// Zertifikate
     case wallet_certificate_list_title
    /// QR code expiration date (technical)\n{DATE}
     case wallet_certificate_qr_code_expiration_date
    /// Datum des ersten positiven Resultats
     case wallet_certificate_recovery_first_positiv_result
    /// Gültig ab
     case wallet_certificate_recovery_from
    /// Gültig bis
     case wallet_certificate_recovery_until
    /// QR-Code erneuern
     case wallet_certificate_renew_now_button
    /// Zur FAQ
     case wallet_certificate_renewal_faq_link_text
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/wieso-soll-ich-den-qr-code-meines-covid-zertifikats-erneuern-obwohl-das-zertifikat
     case wallet_certificate_renewal_faq_link_url
    /// Versuchen Sie es später erneut.
     case wallet_certificate_renewal_general_error_text
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_certificate_renewal_general_error_title
    /// QR-Code wird erneuert
     case wallet_certificate_renewal_in_progress_info
    /// Um den QR-Code erneuern zu können, muss die App online sein.
     case wallet_certificate_renewal_offline_error_text
    /// Keine Verbindung zum Internet
     case wallet_certificate_renewal_offline_error_title
    /// Ablaufdatum QR Code
     case wallet_certificate_renewal_qr_code_expiration
    /// QR-Code zu oft erneuert. Erneuerung temporär gesperrt.
     case wallet_certificate_renewal_rate_limit_error_text
    /// 24h-Limite erreicht
     case wallet_certificate_renewal_rate_limit_error_title
    /// Mehr erfahren
     case wallet_certificate_renewal_required_bubble_button
    /// Um dieses Zertifikat weiterhin verwenden zu können, muss der QR-Code erneuert werden.
     case wallet_certificate_renewal_required_bubble_text
    /// QR-Code erneuern
     case wallet_certificate_renewal_required_bubble_title
    /// Das technische Ablaufdatum für diesen QR-Code ist (bald) erreicht. 
     case wallet_certificate_renewal_required_info
    /// Mehr erfahren
     case wallet_certificate_renewal_successful_bubble_button
    /// Ersetzen Sie auch ausgedruckte oder gespeicherte Versionen dieses Zertifikats durch diese erneuerte Version.
     case wallet_certificate_renewal_successful_bubble_text
    /// Erfolgreich erneuert
     case wallet_certificate_renewal_successful_bubble_title
    /// Der QR-Code wurde erfolgreich erneuert
     case wallet_certificate_renewal_successful_info
    /// Krankheit oder Erreger
     case wallet_certificate_target_disease_title
    /// Testcenter
     case wallet_certificate_test_done_by
    /// Hersteller
     case wallet_certificate_test_holder
    /// Hersteller und Name
     case wallet_certificate_test_holder_and_name
    /// Land des Tests
     case wallet_certificate_test_land
    /// Name
     case wallet_certificate_test_name
    /// Datum Resultat
     case wallet_certificate_test_result_date_title
    /// Nicht erkannt (Negativ)
     case wallet_certificate_test_result_negativ
    /// Erkannt (Positiv)
     case wallet_certificate_test_result_positiv
    /// Ergebnis
     case wallet_certificate_test_result_title
    /// Datum der Probenentnahme
     case wallet_certificate_test_sample_date_title
    /// Typ
     case wallet_certificate_test_type
    /// Unvollständige Impfung
     case wallet_certificate_type_incomplete_vaccine
    /// Land der Impfung
     case wallet_certificate_vaccination_country_title
    /// Impfdatum
     case wallet_certificate_vaccination_date_title
    /// Herausgeber
     case wallet_certificate_vaccination_issuer_title
    /// Art des Impfstoffs
     case wallet_certificate_vaccine_prophylaxis
    /// In der Schweiz gültig ab:\n{DATE}
     case wallet_certificate_valid_from
    /// bis
     case wallet_certificate_valid_until
    /// Gültigkeit in der\nSchweiz
     case wallet_certificate_validity
    /// Prüfung erfolgreich
     case wallet_certificate_verify_success
    /// Das Zertifikat wird geprüft
     case wallet_certificate_verifying
    /// Kein Zutritt.
     case wallet_check_mode_info_2g_not_ok_text
    /// Zutritt zu Betrieben und Veranstaltungen für geimpfte oder genesene Personen.
     case wallet_check_mode_info_2g_ok_text
    /// Für den Zutritt zu Betrieben und Veranstaltungen wird zusätzlich zum Covid-Zertifikat für geimpfte oder genesene Personen ein negatives Testresultat benötigt.
     case wallet_check_mode_info_2g_plus_not_ok_text
    /// Zutritt zu Betrieben und Veranstaltungen für Personen, deren vollständige Impfung, Auffrischimpfung oder Genesung (basierend auf PCR-Test) nicht länger als 120 Tage zurückliegt. Sie benötigen kein zusätzliches Testzertifikat.
     case wallet_check_mode_info_2g_plus_ok_text
    /// Kein Zutritt.
     case wallet_check_mode_info_3g_not_ok_text
    /// Zutritt zu Betrieben und Veranstaltungen für geimpfte, genesene oder negativ getestete Personen.
     case wallet_check_mode_info_3g_ok_text
    /// Info
     case wallet_check_mode_info_title
    /// Versuchen Sie es später erneut.
     case wallet_detail_network_error_text
    /// Prüfung zur Zeit nicht möglich
     case wallet_detail_network_error_title
    /// Prüfung offline nicht möglich
     case wallet_detail_offline_retry_title
    /// Mehr erfahren
     case wallet_eol_banner_invalid_from_first_february_detail_more_info
    /// Dieses Zertifikat wird bald ablaufen.
     case wallet_eol_banner_invalid_from_first_february_detail_text
    /// Verkürzte Gültigkeitsdauer
     case wallet_eol_banner_invalid_from_first_february_detail_title
    /// Verkürzte Gültigkeitsdauer
     case wallet_eol_banner_invalid_from_first_february_homescreen_title
    /// Dieses Covid-Zertifikat kann ab dem 31. Jan. 2022 nicht mehr verwendet werden, da die Gültigkeitsdauer dann bereits abgelaufen sein wird.
     case wallet_eol_banner_invalid_from_first_february_popup_bold_text
    /// Mehr erfahren
     case wallet_eol_banner_invalid_from_first_february_popup_link_text
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/warum-wird-die-gueltigkeitsdauer-der-zertifikate-fuer-eine-impfung-oder-eine
     case wallet_eol_banner_invalid_from_first_february_popup_link_url
    /// Per 31. Jan. 2022 gelten in der Schweiz reduzierte Gültigkeitsdauern von 270 statt 365 Tagen für Covid-Zertifikate für Geimpfte oder Genesene. Dieses Zertifikat ist von der verkürzten Gültigkeitsdauer unmittelbar betroffen:
     case wallet_eol_banner_invalid_from_first_february_popup_text1
    /// Info
     case wallet_eol_banner_invalid_from_first_february_popup_title
    /// Mehr erfahren?
     case wallet_eol_banner_invalid_in_three_weeks_detail_more_info
    /// Dieses Zertifikat läuft bald ab.
     case wallet_eol_banner_invalid_in_three_weeks_detail_text
    /// Info
     case wallet_eol_banner_invalid_in_three_weeks_detail_title
    /// Bald abgelaufen
     case wallet_eol_banner_invalid_in_three_weeks_homescreen_title
    /// Dieses Covid-Zertifikat ist nur noch wenige Tage gültig. Bitte beachten Sie das auf dem Zertifikat ausgewiesene Ablaufdatum.
     case wallet_eol_banner_invalid_in_three_weeks_popup_bold_text
    /// Und nun?
     case wallet_eol_banner_invalid_in_three_weeks_popup_link_text
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/was-soll-ich-tun-wenn-mein-covid-zertifikat-nach-schweizer-gueltigkeitsregeln-bald
     case wallet_eol_banner_invalid_in_three_weeks_popup_link_url
    /// 
     case wallet_eol_banner_invalid_in_three_weeks_popup_text1
    /// 
     case wallet_eol_banner_invalid_in_three_weeks_popup_text2
    /// Info
     case wallet_eol_banner_invalid_in_three_weeks_popup_title
    /// Gültigkeitsdauer für die Schweiz überschritten
     case wallet_error_expired
    /// Format des Zertifikat\nungültig
     case wallet_error_invalid_format
    /// ungültig
     case wallet_error_invalid_format_bold
    /// Zertifikat mit\nungültiger Signatur
     case wallet_error_invalid_signature
    /// ungültiger Signatur
     case wallet_error_invalid_signature_bold
    /// Entspricht nicht den Gültigkeitskriterien der Schweiz
     case wallet_error_national_rules
    /// Das technische Ablaufdatum für diesen QR-Code ist erreicht.
     case wallet_error_qr_code_expired
    /// Zertifikat wurde\nwiderrufen
     case wallet_error_revocation
    /// widerrufen
     case wallet_error_revocation_bold
    /// In der Schweiz gültig ab:\n{DATE}
     case wallet_error_valid_from
    /// Häufige Fragen
     case wallet_faq_header
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
     case wallet_faq_questions_answer_1
    /// Von Covid-19 genesene Personen können das Covid-Zertifikat über ein Online-Formular auf der Webseite des Kantons beantragen. Das Covid-Zertifikat wird anschliessend per Post zugeschickt.
     case wallet_faq_questions_answer_1_1
    /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass Sie in jedem Fall auf Verlangen auch noch ein Ausweisdokument vorweisen müssen.
     case wallet_faq_questions_answer_2
    /// Die Gültigkeitsdauer unterscheidet sich je nachdem, ob Sie eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis haben. Aufgrund neuer wissenschaftlicher Erkenntnisse kann sich die Gültigkeitsdauer verändern. Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
     case wallet_faq_questions_answer_2_1
    /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
     case wallet_faq_questions_answer_3
    /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument gültig.
     case wallet_faq_questions_answer_4
    /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier und/oder als PDF deshalb sorgfältig auf. Bei Verlust und Bedarf nach einem Ersatz kann eine Gebühr erhoben werden.
     case wallet_faq_questions_answer_5
    /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
     case wallet_faq_questions_answer_6
    /// Weitere Informationen
     case wallet_faq_questions_linktext_2_1
    /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/#contents2
     case wallet_faq_questions_linkurl_2_1
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
     case wallet_faq_questions_question_1
    /// Wie erhalte ich nach einer durchgemachten Covid-19-Erkrankung ein Covid-Zertifikat?
     case wallet_faq_questions_question_1_1
    /// Wie kann ich ein Covid-Zertifikat vorweisen?
     case wallet_faq_questions_question_2
    /// Wie lange ist das Covid-Zertifikat gültig?
     case wallet_faq_questions_question_2_1
    /// Wo sind meine Daten gespeichert?
     case wallet_faq_questions_question_3
    /// Wie werden Missbrauch und Fälschung verhindert?
     case wallet_faq_questions_question_4
    /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
     case wallet_faq_questions_question_5
    /// Was ist das Zertifikat Light?
     case wallet_faq_questions_question_6
    /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
     case wallet_faq_questions_subtitle
    /// Was sind Covid-Zertifikate?
     case wallet_faq_questions_title
    /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
     case wallet_faq_works_answer_1
    /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument des Zertifikatsinhabers / der Zertifikatsinhaberin gültig.
     case wallet_faq_works_answer_2
    /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
     case wallet_faq_works_answer_2_1
    /// Die App prüft automatisch, ob Ihr Zertifikat den Gültigkeitskriterien der Schweiz entspricht. Sollte Ihr Covid-Zertifikat abgelaufen oder technisch ungültig sein, wird Ihnen dies direkt auf dem Zertifikat in der App angezeigt.
     case wallet_faq_works_answer_3
    /// Sie können die App ohne eine Internetverbindung verwenden. Auch im Offline-Modus können Zertifikate vorgewiesen und von den Prüfern gescannt und verifiziert werden.\n\nUm in der «COVID Certificate»-App anzeigen zu können, ob ihr Zertifikat den Gültigkeitskriterien der Schweiz entspricht und bis wann Ihr Zertifikat gültig ist, muss die App jedoch regelmässig online sein.
     case wallet_faq_works_answer_3_1
    /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
     case wallet_faq_works_answer_4
    /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
     case wallet_faq_works_answer_5
    /// In der «COVID Certificate»-App finden Sie in der Detailansicht des elektronischen Covid-Zertifikats die Funktion «Exportieren». Damit können Sie ein PDF erstellen, dieses speichern und ausdrucken.
     case wallet_faq_works_answer_5_1
    /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihrem Mobilgerät speichern. Laden Sie dazu die App erneut herunter und scannen Sie anschliessend den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
     case wallet_faq_works_answer_6
    /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
     case wallet_faq_works_question_1
    /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
     case wallet_faq_works_question_2
    /// Was ist ein Transfer-Code?
     case wallet_faq_works_question_2_1
    /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
     case wallet_faq_works_question_3
    /// Kann ich die App auch offline verwenden?
     case wallet_faq_works_question_3_1
    /// Wie sind meine Daten geschützt?
     case wallet_faq_works_question_4
    /// Welche Daten sind im QR-Code enthalten?
     case wallet_faq_works_question_5
    /// Ich habe das Covid-Zertifikat ausschliesslich elektronisch in der App. Wie komme ich zum Zertifikat als PDF oder auf Papier?
     case wallet_faq_works_question_5_1
    /// Was muss ich tun, wenn ich das Covid-Zertifikat oder die App lösche?
     case wallet_faq_works_question_6
    /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
     case wallet_faq_works_subtitle
    /// Wie funktioniert \ndie App?
     case wallet_faq_works_title
    /// Gültigkeit im Ausland
     case wallet_foreign_rules_check_button
    /// Wählen
     case wallet_foreign_rules_check_country_empty_label
    /// Land:
     case wallet_foreign_rules_check_country_label
    /// Land auswählen
     case wallet_foreign_rules_check_country_picker_title
    /// Die angegebene Uhrzeit liegt in der Vergangenheit
     case wallet_foreign_rules_check_date_in_past_error
    /// Einreise am:
     case wallet_foreign_rules_check_date_label
    /// Fehler beim Laden der verfügbaren Länder
     case wallet_foreign_rules_check_error_title
    /// Prüfen für:
     case wallet_foreign_rules_check_form_title
    /// Für die Aktualität und Vollständigkeit der gegebenen Informationen übernimmt der Bund keine Haftung.
     case wallet_foreign_rules_check_hint_1
    /// Die Einreiseregeln können sich ändern. Prüfen Sie daher die Gültigkeit kurz vor der Abreise und informieren Sie sich zusätzlich online über die aktuellen Einreiseregeln des Ziellandes.
     case wallet_foreign_rules_check_hint_2
    /// Die oben genannten Angaben beziehen sich nur auf die Einreiseregeln des Ziellandes. Für allfällige zertifikatspflichtige Bereiche innerhalb des Landes können andere Regeln gelten.
     case wallet_foreign_rules_check_hint_3
    /// Land nicht gefunden? Nicht alle Länder akzeptieren Covid-Zertifikate oder es wurden keine Einreiseregeln verfügbar gemacht.
     case wallet_foreign_rules_check_hint_4
    /// Mehr Informationen finden Sie unter
     case wallet_foreign_rules_check_hints_more_info_label
    /// reopen.europa.eu
     case wallet_foreign_rules_check_hints_more_info_link_text
    /// https://reopen.europa.eu/
     case wallet_foreign_rules_check_hints_more_info_link_url
    /// Hinweise
     case wallet_foreign_rules_check_hints_title
    /// Um die Gültigkeit zu überprüfen, muss Ihr Smartphone mit dem Internet verbunden sein.
     case wallet_foreign_rules_check_network_error_text
    /// {COUNTRY}, {DATE}
     case wallet_foreign_rules_check_state_country_and_date
    /// Bitte wählen Sie ein Land und den Einreisezeitpunkt aus.
     case wallet_foreign_rules_check_state_empty
    /// Ungültig für die Einreise nach:
     case wallet_foreign_rules_check_state_invalid
    /// Gültig für die Einreise nach:
     case wallet_foreign_rules_check_state_valid
    /// Finden Sie vor einer Auslandreise heraus, ob Ihr Covid-Zertifikat zum Zeitpunkt der Einreise ins Zielland gültig ist.
     case wallet_foreign_rules_check_subtitle
    /// Gültigkeit für Reisen ins Ausland
     case wallet_foreign_rules_check_title
    /// Sie haben ein Covid-Zertifikat auf Papier oder als PDF und möchten es zur App hinzufügen.
     case wallet_homescreen_add_certificate_description
    /// Zertifikat hinzufügen
     case wallet_homescreen_add_title
    /// Transfer-Code erstellen
     case wallet_homescreen_add_transfer_code
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
     case wallet_homescreen_explanation
    /// Gültigkeit konnte nicht ermittelt werden
     case wallet_homescreen_network_error
    /// Offline Modus
     case wallet_homescreen_offline
    /// PDF importieren
     case wallet_homescreen_pdf_import
    /// QR-Code scannen
     case wallet_homescreen_qr_code_scannen
    /// Nächsten Schritt wählen
     case wallet_homescreen_what_to_do
    /// Zur Check-App
     case wallet_info_box_certificate_scan_button_check_app
    /// Verstanden
     case wallet_info_box_certificate_scan_close
    /// Für eine Datenschutzkonforme und schnellere Prüfung nutzen Sie die "COVID Certificate Check"-App.
     case wallet_info_box_certificate_scan_text
    /// «COVID Certificate Check»-App.
     case wallet_info_box_certificate_scan_text_bold
    /// Wollen Sie Zertifikate überprüfen?
     case wallet_info_box_certificate_scan_title
    /// Aktivieren
     case wallet_notification_disabled_button
    /// Tipp: Mitteilungen aktivieren
     case wallet_notification_disabled_titel
    /// Weiter
     case wallet_notification_permission_button
    /// Die App kann Sie informieren, sobald das Zertifikat eingetroffen ist.  Erlauben Sie dazu der App, Ihnen Mitteilungen zu senden.
     case wallet_notification_permission_text
    /// Mitteilungen erlauben
     case wallet_notification_permission_title
    /// Das Covid-Zertifikat ist eingetroffen
     case wallet_notification_transfer_text
    /// Transfer erfolgreich
     case wallet_notification_transfer_title
    /// Um die aktuelle Gültigkeit anzeigen zu können, muss die App regelmässig online sein.
     case wallet_offline_description
    /// Akzeptieren
     case wallet_onboarding_accept_button
    /// Die App
     case wallet_onboarding_app_header
    /// Mit der App können Sie Covid-Zertifikate sicher auf dem Smartphone aufbewahren und einfach vorweisen.
     case wallet_onboarding_app_text
    /// COVID Certificate
     case wallet_onboarding_app_title
    /// Datenschutzerklärung &\nNutzungsbedingungen
     case wallet_onboarding_external_privacy_button
    /// Nutzungsbedingungen
     case wallet_onboarding_privacy_conditionsofuse_title
    /// Datenschutz
     case wallet_onboarding_privacy_header
    /// Datenschutzerklärung
     case wallet_onboarding_privacy_privacypolicy_title
    /// Die Zertifikate sind nur lokal auf Ihrem Smartphone hinterlegt. Die Daten werden nicht in einem zentralen System gespeichert.
     case wallet_onboarding_privacy_text
    /// Ihre Daten bleiben \nin der App
     case wallet_onboarding_privacy_title
    /// Vorteile
     case wallet_onboarding_show_header
    /// Die auf dem Covid-Zertifikat dargestellten Daten sind auch im QR-Code enthalten.
     case wallet_onboarding_show_text1
    /// Beim Vorweisen wird der QR-Code mit einer Prüf-App gescannt. Die enthaltenen Daten werden dabei automatisch auf Echtheit und Gültigkeit überprüft.
     case wallet_onboarding_show_text2
    /// Zertifikate einfach vorweisen
     case wallet_onboarding_show_title
    /// Vorteile
     case wallet_onboarding_store_header
    /// Covid-Zertifikate können einfach zur App hinzugefügt und digital aufbewahrt werden.
     case wallet_onboarding_store_text1
    /// Die App prüft die Zertifikate auf ihre Gültigkeit in der Schweiz. So können Sie sich versichern, dass Ihre Zertifikate gültig sind.
     case wallet_onboarding_store_text2
    /// Covid-Zertifikate digital aufbewahren
     case wallet_onboarding_store_title
    /// Ausserhalb der Schweiz nicht gültig
     case wallet_only_valid_in_switzerland
    /// https://covidcertificate-form.admin.ch/immunityrequest
     case wallet_rat_recovery_conversion_url
    /// Für Prüfende
     case wallet_refresh_button_info_fat_title_3
    /// Mehr erfahren
     case wallet_refresh_button_info_link_text
    /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/covid-zertifikat/covid-zertifikat-pruefer-aussteller-technische-informationen.html#1070048217
     case wallet_refresh_button_info_link_url
    /// Der «Refresh-Button» wurde entfernt.
     case wallet_refresh_button_info_text_1
    /// Sollte Ihr Covid-Zertifikat abgelaufen oder technisch ungültig sein, wird Ihnen dies direkt auf dem Zertifikat angezeigt.
     case wallet_refresh_button_info_text_2
    /// Die Prüfung von Covid-Zertifikaten ist mit der App «COVID Certificate Check» vorzunehmen.
     case wallet_refresh_button_info_text_3
    /// Info
     case wallet_refresh_button_info_title
    /// Erneut scannen
     case wallet_scan_again
    /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
     case wallet_scanner_explanation
    /// Erstens
     case wallet_scanner_how_it_works_accessibility_icon1
    /// Zweitens
     case wallet_scanner_how_it_works_accessibility_icon2
    /// Drittens
     case wallet_scanner_how_it_works_accessibility_icon3
    /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
     case wallet_scanner_howitworks_answer1
    /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
     case wallet_scanner_howitworks_external_link
    /// Weitere Informationen
     case wallet_scanner_howitworks_external_link_title
    /// So funktioniert's
     case wallet_scanner_howitworks_header
    /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
     case wallet_scanner_howitworks_question1
    /// Um ein Covid-Zertifikat zur App hinzufügen zu können, benötigen Sie das Originalzertifikat auf Papier oder als PDF.
     case wallet_scanner_howitworks_text1
    /// Tippen Sie in der App auf «Hinzufügen», um ein neues Zertifikat zur App hinzuzufügen.
     case wallet_scanner_howitworks_text2
    /// Halten Sie nun die Kamera des Smartphones über den QR-Code auf dem Originalzertifikat, um den Code einzuscannen.
     case wallet_scanner_howitworks_text3
    /// Es erscheint eine Vorschau des Covid-Zertifikats. Tippen Sie auf «Hinzufügen» um das Zertifikat sicher in der App zu speichern.
     case wallet_scanner_howitworks_text4
    /// Covid-Zertifikate\nhinzufügen
     case wallet_scanner_howitworks_title
    /// So funktioniert's
     case wallet_scanner_info_button
    /// Hinzufügen
     case wallet_scanner_title
    /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-app.html
     case wallet_terms_privacy_link
    /// Datum, Uhrzeit oder Zeitzone auf dem Gerät sind falsch eingestellt.
     case wallet_time_inconsistency_error_text
    /// Prüfung nicht möglich
     case wallet_time_inconsistency_error_title
    /// Transfer
     case wallet_transfer_code_card_title
    /// Ihr Transfer-Code wurde erstellt
     case wallet_transfer_code_code_created_title
    /// Transfer Code kopiert
     case wallet_transfer_code_copied
    /// Code erstellen
     case wallet_transfer_code_create_code_button
    /// Erstellt am {DATE}
     case wallet_transfer_code_createdat
    /// Fertig
     case wallet_transfer_code_done_button
    /// Transfer-Code konnte nicht erstellt werden
     case wallet_transfer_code_error_title
    /// Noch {DAYS} Tage gültig
     case wallet_transfer_code_expire_plural
    /// {DAYS} Tage
     case wallet_transfer_code_expire_plural_bold
    /// Noch 1 Tag gültig
     case wallet_transfer_code_expire_singular
    /// 1 Tag
     case wallet_transfer_code_expire_singular_bold
    /// Wenn Sie einen Covid-Test machen (PCR-Test oder Antigen-Schnelltest), kann der Transfer-Code zur schnellen Übermittlung von Covid-Zertifikaten zum Einsatz kommen.\n\nInformieren Sie sich bei Ihrem Testcenter, in der Apotheke oder bei Ihrem Arzt, ob die Übermittlung per Transfer-Code angeboten wird.
     case wallet_transfer_code_faq_questions_answer_1
    /// Aktuell ist die Übermittlung per Transfer-Code auf Covid-Tests ausgelegt. Wie Sie ein Covid-Zertifikat nach einer Impfung erhalten erfahren Sie hier:
     case wallet_transfer_code_faq_questions_answer_2
    /// Falls die Stelle, die den Covid-Test durchführt, die Übermittlung per Transfer-Code anbietet, werden Sie bereits bei der Anmeldung oder der Testentnahme nach einem Transfer-Code gefragt.\n\nDen Transfer-Code können Sie in der «COVID Certificate»-App erstellen. Tippen Sie dazu auf dem Startbildschirm auf «Hinzufügen» resp. auf das «Plus»-Symbol unten rechts. Danach tippen Sie auf «Transfer-Code erstellen».\n\nDie App zeigt Ihnen einen 9-stelligen Code an. Diesen können Sie entweder bei der Anmeldung in ein Formular eintragen oder direkt bei der Testentnahme angeben.
     case wallet_transfer_code_faq_questions_answer_3
    /// Nein, ein Transfer-Code kann nur einmal verwendet werden. Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie bitte für jedes Zertifikat einen neuen Code.
     case wallet_transfer_code_faq_questions_answer_4
    /// Weitere Informationen
     case wallet_transfer_code_faq_questions_linktext_2
    /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
     case wallet_transfer_code_faq_questions_linkurl_2
    /// Wer bietet die Übermittlung per Transfer-Code an?
     case wallet_transfer_code_faq_questions_question_1
    /// Können Transfer-Codes auch zur Übermittlung von Impfzertifikaten verwendet werden?
     case wallet_transfer_code_faq_questions_question_2
    /// Wie funktioniert die Übermittlung per Transfer-Code?
     case wallet_transfer_code_faq_questions_question_3
    /// Kann ich den Transfer-Code mehrmals benutzen?
     case wallet_transfer_code_faq_questions_question_4
    /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
     case wallet_transfer_code_faq_questions_subtitle
    /// Covid-Zertifikate direkt in die App geliefert
     case wallet_transfer_code_faq_questions_title
    /// Für den Transfer wird Ihr Covid-Zertifikat verschlüsselt bereitgestellt. Der Transfer-Code stellt sicher, dass nur Ihre App das Covid-Zertifikat empfangen kann. Unmittelbar nach dem Transfer werden die Daten wieder vom Server gelöscht.
     case wallet_transfer_code_faq_works_answer_1
    /// Sobald das Zertifikat vom Labor oder Testcenter generiert wurde, steht es zum Transfer zur Verfügung. Stellen Sie sicher, dass Ihr Smartphone mit dem Internet verbunden ist, um Zertifikate empfangen zu können.\n\nSollte ihr Covid-Zertifikat dennoch nicht eintreffen, fragen Sie bei der Stelle nach, die den Test durchgeführt hat (Testcenter, Apotheke, Ärztin / Arzt).
     case wallet_transfer_code_faq_works_answer_2
    /// Bei einem positiven Antigen-Schnelltest erhalten Sie vom Labor kein Covid-Zertifikat. \n\nBei einem positiven PCR-Test erhalten Sie ein Covid-Zertifikat für Genesene. Es ist ab dem 11. Tag nach der Testentnahme gültig.
     case wallet_transfer_code_faq_works_answer_3
    /// Die App prüft regelmässig, ob ein Covid-Zertifikat für Ihren Transfer-Code verfügbar ist.
     case wallet_transfer_code_faq_works_intro_1
    /// Sobald das Covid-Zertifikat verfügbar ist, erscheint es in der App. Wenn Sie Mitteilungen aktiviert haben, werden Sie von der App benachrichtigt.
     case wallet_transfer_code_faq_works_intro_2
    /// Nach {TRANSFER_CODE_VALIDITY} Tagen läuft der Transfer-Code ab. Danach wartet die App noch für weitere 72h auf einen möglichen Transfer, bevor der Transfer-Code ungültig wird.
     case wallet_transfer_code_faq_works_intro_3
    /// Wie sind meine Daten beim Transfer geschützt?
     case wallet_transfer_code_faq_works_question_1
    /// Was kann ich tun, wenn das Zertifikat nicht ankommt?
     case wallet_transfer_code_faq_works_question_2
    /// Was passiert bei einem positiven Testresultat?
     case wallet_transfer_code_faq_works_question_3
    /// So funktioniert der Transfer
     case wallet_transfer_code_faq_works_title
    /// Versuchen Sie es später erneut.
     case wallet_transfer_code_generate_error_text
    /// Ein unerwarteter Fehler ist aufgetreten.
     case wallet_transfer_code_generate_error_title
    /// Um einen Transfer-Code erstellen zu können, muss die App online sein.
     case wallet_transfer_code_generate_no_internet_error_text
    /// Nächste Schritte
     case wallet_transfer_code_next_steps
    /// Übergeben Sie den Code bei der Testentnahme der Apotheke, dem Testcenter oder der Ärztin / dem Arzt.
     case wallet_transfer_code_next_steps1
    /// Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie für jedes Zertifikat einen neuen Code.
     case wallet_transfer_code_next_steps2
    /// Keine Verbindung zum Internet
     case wallet_transfer_code_no_internet_title
    /// Code abgelaufen
     case wallet_transfer_code_old_code
    /// Code erstellen
     case wallet_transfer_code_onboarding_button
    /// So funktioniert's
     case wallet_transfer_code_onboarding_howto
    /// Sie können Transfer-Codes z. B. bei Covid-Tests angeben. Sie erhalten darauf das Covid-Zertifikat direkt in die App geliefert.
     case wallet_transfer_code_onboarding_text
    /// Transfer Codes
     case wallet_transfer_code_onboarding_title
    /// Transfer fehlgeschlagen
     case wallet_transfer_code_state_expired
    /// Mit diesem Transfer kann kein Zertifikat mehr empfangen werden.
     case wallet_transfer_code_state_no_certificate
    /// Zuletzt aktualisiert\n{DATE}
     case wallet_transfer_code_state_updated
    /// Warten auf Transfer
     case wallet_transfer_code_state_waiting
    /// Die Uhrzeit muss richtig eingestellt sein, damit Transfer-Codes funktionieren. Passen Sie Ihre Uhrzeit an und versuchen sie es erneut.
     case wallet_transfer_code_time_inconsistency_text
    /// Uhrzeit Fehler
     case wallet_transfer_code_time_inconsistency_title
    /// Transfer-Code
     case wallet_transfer_code_title
    /// +41 58 466 07 99
     case wallet_transfer_code_unexpected_error_phone_number
    /// Kontaktieren Sie den Support
     case wallet_transfer_code_unexpected_error_text
    /// Unerwarteter Fehler
     case wallet_transfer_code_unexpected_error_title
    /// Aktualisierung zur Zeit nicht möglich
     case wallet_transfer_code_update_error_title
    /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
     case wallet_transfer_code_update_general_error_text
    /// Um den Transfer empfangen zu können, muss die App online sein.
     case wallet_transfer_code_update_no_internet_error_text
    /// Wollen Sie den Transfer-Code wirklich löschen?
     case wallet_transfer_delete_confirm_text
    /// Mit diesem Update können Sie in der App eine Zertifikatskopie ohne Gesundheitsdaten für die Verwendung in der Schweiz generieren lassen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
     case wallet_update_boarding_certificate_light_text
    /// Zertifikat Light
     case wallet_update_boarding_certificate_light_title
    /// Update
     case wallet_update_boarding_header
    /// Neu wird auf dem Covid-Zertifikat das Feld «Gültigkeit in der Schweiz» nicht mehr dargestellt. Stattdessen zeigt die App den Zeitpunkt der Impfung bzw. des Tests an. Warum?
     case wallet_update_boarding_page_1_text
    /// Was ist neu?
     case wallet_update_boarding_page_1_title
    /// Die Zertifikatspflicht in der Schweiz wurde im Februar 2022 aufgehoben.
     case wallet_update_boarding_page_2_bullet_1
    /// Die Schweizer Gültigkeitsdauern bestehen seitdem nur noch formell und haben im Inland keine praktische Bedeutung mehr.
     case wallet_update_boarding_page_2_bullet_2
    /// Die Schweizer Gültigkeitsdauer hat auch im Ausland keine Bedeutung.
     case wallet_update_boarding_page_2_bullet_3
    /// Covid-Zertifikate \nin der Schweiz
     case wallet_update_boarding_page_2_title
    /// Im Ausland gelten die Regeln des entsprechenden Landes.
     case wallet_update_boarding_page_3_bullet_1
    /// Neu zeigt die App an, wie viele Tage eine Impfung bzw. ein Test her ist.
     case wallet_update_boarding_page_3_bullet_2
    /// So können Sie einfacher feststellen, ob Ihr Zertifikat den Regeln Ihres Ziellandes entspricht (falls das Land noch ein Covid-Zertifikat voraussetzt).
     case wallet_update_boarding_page_3_bullet_3
    /// Covid-Zertifikate \nim Ausland
     case wallet_update_boarding_page_3_title
    /// Die meisten Länder in Europa haben die Zertifikatspflicht für die Einreise inzwischen aufgehoben.
     case wallet_update_boarding_page_4_bullet_1
    /// Die Funktion «Gültigkeit im Ausland» wurde daher ebenfalls entfernt.
     case wallet_update_boarding_page_4_bullet_2
    /// Ob in einem Land noch eine Zertifikatspflicht gilt, erfahren Sie auf diesen Webseiten:
     case wallet_update_boarding_page_4_bullet_3
    /// reopen.europa.eu
     case wallet_update_boarding_page_4_link_1_text
    /// https://reopen.europa.eu
     case wallet_update_boarding_page_4_link_1_url
    /// iatatravelcentre.com
     case wallet_update_boarding_page_4_link_2_text
    /// https://www.iatatravelcentre.com
     case wallet_update_boarding_page_4_link_2_url
    /// Aktuelle Situation in Europa und weltweit
     case wallet_update_boarding_page_4_title
    /// UVCI kopiert
     case wallet_uvci_copied
    /// {DAYS} Tagen
     case wallet_validity_since_days_plural
    /// 1 Tag
     case wallet_validity_since_days_singular
    /// {HOURS} Stunden
     case wallet_validity_since_hours_plural
    /// 1 Stunde
     case wallet_validity_since_hours_singular
    /// vor mehr als
     case wallet_validity_since_more_hours_prefix
    /// vor
     case wallet_validity_since_prefix
    /// Positiv getestet
     case wallet_validity_since_recovery_date
    /// Negativ getestet
     case wallet_validity_since_test_date
    /// Impfdatum
     case wallet_validity_since_vaccination_date
  }

  /// Zertifikat hinzufügen
   static var accessibility_add_button: String { return UBLocalized.tr(Key.accessibility_add_button) }
  /// Schliessen
   static var accessibility_close_button: String { return UBLocalized.tr(Key.accessibility_close_button) }
  /// erweitert
   static var accessibility_expandable_box_expanded_state: String { return UBLocalized.tr(Key.accessibility_expandable_box_expanded_state) }
  /// reduziert
   static var accessibility_expandable_box_reduced_state: String { return UBLocalized.tr(Key.accessibility_expandable_box_reduced_state) }
  /// Häufige Fragen
   static var accessibility_faq_button: String { return UBLocalized.tr(Key.accessibility_faq_button) }
  /// Information
   static var accessibility_info_box: String { return UBLocalized.tr(Key.accessibility_info_box) }
  /// Impressum
   static var accessibility_info_button: String { return UBLocalized.tr(Key.accessibility_info_button) }
  /// Taschenlampe ausschalten
   static var accessibility_lamp_off_button: String { return UBLocalized.tr(Key.accessibility_lamp_off_button) }
  /// Taschenlampe einschalten
   static var accessibility_lamp_on_button: String { return UBLocalized.tr(Key.accessibility_lamp_on_button) }
  /// Zertifikate Liste
   static var accessibility_list_button: String { return UBLocalized.tr(Key.accessibility_list_button) }
  /// QR-Code
   static var accessibility_qr_code: String { return UBLocalized.tr(Key.accessibility_qr_code) }
  /// Aktualisieren
   static var accessibility_refresh_button: String { return UBLocalized.tr(Key.accessibility_refresh_button) }
  /// Zugriff auf Kamera erlauben
   static var camera_permission_dialog_action: String { return UBLocalized.tr(Key.camera_permission_dialog_action) }
  /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
   static var camera_permission_dialog_text: String { return UBLocalized.tr(Key.camera_permission_dialog_text) }
  /// Abbrechen
   static var cancel_button: String { return UBLocalized.tr(Key.cancel_button) }
  /// Was bedeutet das?
   static var cert_renewal_info_expired_heading: String { return UBLocalized.tr(Key.cert_renewal_info_expired_heading) }
  /// Die QR-Codes der Covid-Zertifikate sind technisch nur begrenzt gültig.
   static var cert_renewal_info_expired_text_1: String { return UBLocalized.tr(Key.cert_renewal_info_expired_text_1) }
  /// Damit dieses Zertifikat (z. B. auf Reisen) weiterhin geprüft werden kann, muss der QR-Code erneuert werden.
   static var cert_renewal_info_expired_text_2: String { return UBLocalized.tr(Key.cert_renewal_info_expired_text_2) }
  /// Die Erneuerung können Sie hier in der App selbst durchführen (Internetverbindung nötig). Die Daten des aktuellen Zertifikats werden dazu verschlüsselt von der App an das System des Bundes zur Ausstellung von Covid-Zertifikaten übermittelt. Danach wird ein neuer QR-Code zurück an die App gesendet. Anschliessend werden die Daten gelöscht.
   static var cert_renewal_info_expired_text_3: String { return UBLocalized.tr(Key.cert_renewal_info_expired_text_3) }
  /// Erneuern Sie den QR-Code auch dann, wenn die Gültigkeit in der Schweiz bald abläuft oder bereits abgelaufen ist.
   static var cert_renewal_info_expired_text_4: String { return UBLocalized.tr(Key.cert_renewal_info_expired_text_4) }
  /// Was bedeutet das?
   static var cert_renewal_info_info_heading: String { return UBLocalized.tr(Key.cert_renewal_info_info_heading) }
  /// Die QR-Codes der Covid-Zertifikate sind technisch nur begrenzt gültig.
   static var cert_renewal_info_info_text_1: String { return UBLocalized.tr(Key.cert_renewal_info_info_text_1) }
  /// Damit dieses Zertifikat (z. B. auf Reisen) weiterhin geprüft werden kann, muss der QR-Code erneuert werden.
   static var cert_renewal_info_info_text_2: String { return UBLocalized.tr(Key.cert_renewal_info_info_text_2) }
  /// Die Erneuerung können Sie hier in der App selbst durchführen (Internetverbindung nötig). Die Daten des aktuellen Zertifikats werden dazu verschlüsselt von der App an das System des Bundes zur Ausstellung von Covid-Zertifikaten übermittelt. Danach wird ein neuer QR-Code zurück an die App gesendet. Anschliessend werden die Daten gelöscht.
   static var cert_renewal_info_info_text_3: String { return UBLocalized.tr(Key.cert_renewal_info_info_text_3) }
  /// Wieso Sie den QR-Code auch dann erneuern sollten, wenn Ihr Impf- oder Genesungszertifikat nach den Schweizer Gültigkeitsregeln bald abläuft oder bereits abgelaufen ist, lesen Sie in dieser FAQ.
   static var cert_renewal_info_info_text_4: String { return UBLocalized.tr(Key.cert_renewal_info_info_text_4) }
  /// Wichtig!
   static var cert_renewal_info_renewed_heading: String { return UBLocalized.tr(Key.cert_renewal_info_renewed_heading) }
  /// Ersetzen Sie auch zuvor ausgedruckte oder gespeicherte Zertifikate durch diese erneuerte Version.
   static var cert_renewal_info_renewed_text_1: String { return UBLocalized.tr(Key.cert_renewal_info_renewed_text_1) }
  /// Wie lange ein Covid-Zertifikat gültig ist wird in jedem Land gemäss den aktuell geltenden Regeln berechnet. Die Erneuerung des QR-Codes hat darauf keinen Einfluss.
   static var cert_renewal_info_renewed_text_2: String { return UBLocalized.tr(Key.cert_renewal_info_renewed_text_2) }
  /// Genesen
   static var certificate_reason_recovered: String { return UBLocalized.tr(Key.certificate_reason_recovered) }
  /// Test
   static var certificate_reason_tested: String { return UBLocalized.tr(Key.certificate_reason_tested) }
  /// Impfung
   static var certificate_reason_vaccinated: String { return UBLocalized.tr(Key.certificate_reason_vaccinated) }
  /// Schliessen
   static var close_button: String { return UBLocalized.tr(Key.close_button) }
  /// Weiter
   static var continue_button: String { return UBLocalized.tr(Key.continue_button) }
  /// Genesung (Antigen-Schnelltest)
   static var covid_certificate_antigen_positive_test: String { return UBLocalized.tr(Key.covid_certificate_antigen_positive_test) }
  /// Ausnahme
   static var covid_certificate_ch_ausnahme_list_label: String { return UBLocalized.tr(Key.covid_certificate_ch_ausnahme_list_label) }
  /// Ausnahmezertifikat
   static var covid_certificate_ch_ausnahme_test_title: String { return UBLocalized.tr(Key.covid_certificate_ch_ausnahme_test_title) }
  /// Genesung
   static var covid_certificate_recovery_title: String { return UBLocalized.tr(Key.covid_certificate_recovery_title) }
  /// Befund
   static var covid_certificate_sero_positiv_test_befund_label: String { return UBLocalized.tr(Key.covid_certificate_sero_positiv_test_befund_label) }
  /// Genügend
   static var covid_certificate_sero_positiv_test_befund_value: String { return UBLocalized.tr(Key.covid_certificate_sero_positiv_test_befund_value) }
  /// Genesung (Antikörper)
   static var covid_certificate_sero_positiv_test_title: String { return UBLocalized.tr(Key.covid_certificate_sero_positiv_test_title) }
  /// Test
   static var covid_certificate_test_title: String { return UBLocalized.tr(Key.covid_certificate_test_title) }
  /// Covid-Zertifikat
   static var covid_certificate_title: String { return UBLocalized.tr(Key.covid_certificate_title) }
  /// Impfung
   static var covid_certificate_vaccination_title: String { return UBLocalized.tr(Key.covid_certificate_vaccination_title) }
  /// Löschen
   static var delete_button: String { return UBLocalized.tr(Key.delete_button) }
  /// Einstellungen ändern
   static var error_action_change_settings: String { return UBLocalized.tr(Key.error_action_change_settings) }
  /// Erneut versuchen
   static var error_action_retry: String { return UBLocalized.tr(Key.error_action_retry) }
  /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
   static var error_camera_permission_text: String { return UBLocalized.tr(Key.error_camera_permission_text) }
  /// Kein Zugriff auf Kamera
   static var error_camera_permission_title: String { return UBLocalized.tr(Key.error_camera_permission_title) }
  /// Ein Speicher der App konnte nicht entschlüsselt werden. Um die App weiter zu benutzen muss der Speicher gelöscht und neu erstellt werden. Dabei gehen Daten verloren.
   static var error_corrupt_sharedprefs_text: String { return UBLocalized.tr(Key.error_corrupt_sharedprefs_text) }
  /// Entschlüsselungsfehler
   static var error_corrupt_sharedprefs_title: String { return UBLocalized.tr(Key.error_corrupt_sharedprefs_title) }
  /// Zurücksetzen
   static var error_decryption_reset_button: String { return UBLocalized.tr(Key.error_decryption_reset_button) }
  /// Zertifikate konnten nicht geladen werden\n\nCode: {ERROR_CODE}
   static var error_decryption_text: String { return UBLocalized.tr(Key.error_decryption_text) }
  /// Die Datei enthält entweder keinen gültigen QR-Code oder der QR-Code konnte nicht erkannt werden.
   static var error_file_import_text: String { return UBLocalized.tr(Key.error_file_import_text) }
  /// Import fehlgeschlagen
   static var error_file_import_title: String { return UBLocalized.tr(Key.error_file_import_title) }
  /// Überprüfen Sie Ihre Internet Verbindung.
   static var error_network_text: String { return UBLocalized.tr(Key.error_network_text) }
  /// Netzwerkfehler
   static var error_network_title: String { return UBLocalized.tr(Key.error_network_title) }
  /// Fehler
   static var error_title: String { return UBLocalized.tr(Key.error_title) }
  /// Aktualisieren
   static var force_update_button: String { return UBLocalized.tr(Key.force_update_button) }
  /// Laden Sie die neue Version der App.
   static var force_update_text: String { return UBLocalized.tr(Key.force_update_text) }
  /// Update benötigt
   static var force_update_title: String { return UBLocalized.tr(Key.force_update_title) }
  /// Impressum
   static var impressum_title: String { return UBLocalized.tr(Key.impressum_title) }
  /// Mehr erfahren
   static var infobox_generic_button: String { return UBLocalized.tr(Key.infobox_generic_button) }
  /// Wenn Sie die App löschen, Ihr Smartphone wechseln oder verlieren, gehen auch Ihre Covid-Zertifikate verloren.\nBewahren Sie Ihre Zertifikate daher auch ausserhalb der App auf, indem Sie diese als PDF exportieren.
   static var infobox_generic_text: String { return UBLocalized.tr(Key.infobox_generic_text) }
  /// Zertifikat sichern!
   static var infobox_generic_title: String { return UBLocalized.tr(Key.infobox_generic_title) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/ich-habe-das-covid-zertifikat-ausschliesslich-elektronisch-der-covid-certificate
   static var infobox_generic_url_android: String { return UBLocalized.tr(Key.infobox_generic_url_android) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/ich-habe-das-covid-zertifikat-ausschliesslich-elektronisch-der-covid-certificate
   static var infobox_generic_url_ios: String { return UBLocalized.tr(Key.infobox_generic_url_ios) }
  /// Aktualisieren
   static var infobox_update_button: String { return UBLocalized.tr(Key.infobox_update_button) }
  /// Laden Sie die neue Version der App.
   static var infobox_update_text: String { return UBLocalized.tr(Key.infobox_update_text) }
  /// Neue Version verfügbar
   static var infobox_update_title: String { return UBLocalized.tr(Key.infobox_update_title) }
  /// Einstellungen
   static var ios_settings_open: String { return UBLocalized.tr(Key.ios_settings_open) }
  /// de
   static var language_key: String { return UBLocalized.tr(Key.language_key) }
  /// Sprache
   static var language_title: String { return UBLocalized.tr(Key.language_title) }
  /// Die App benötigt Zugriff auf die Kamera, um den QR-Code scannen zu können.
   static var NSCameraUsageDescription: String { return UBLocalized.tr(Key.NSCameraUsageDescription) }
  /// OK
   static var ok_button: String { return UBLocalized.tr(Key.ok_button) }
  /// Kein gültiger Code
   static var qr_scanner_error: String { return UBLocalized.tr(Key.qr_scanner_error) }
  /// Zum Formular
   static var rat_conversion_form_button: String { return UBLocalized.tr(Key.rat_conversion_form_button) }
  /// Ich bin einverstanden, dass die Daten dieses Covid-Zertifikats in das Formular der Nationalen Antragsstelle (eine Website des Bundes) übertragen werden.
   static var rat_conversion_form_text: String { return UBLocalized.tr(Key.rat_conversion_form_text) }
  /// Zum Online-Formular der Nationalen Antragsstelle
   static var rat_conversion_form_title: String { return UBLocalized.tr(Key.rat_conversion_form_title) }
  /// Ist die Beantragung erfolgreich, wird Ihnen das neue EU-kompatible Covid-Zertifikat per Post zugestellt und kann von Ihnen in die App übernommen werden. Eine direkte Zustellung in die App ist nicht möglich.
   static var rat_conversion_info1_text: String { return UBLocalized.tr(Key.rat_conversion_info1_text) }
  /// Durch die Übernahme der Daten des Zertifikats in das Online-Formular kann Ihr Antrag einfacher verarbeitet werden.
   static var rat_conversion_info2_text: String { return UBLocalized.tr(Key.rat_conversion_info2_text) }
  /// Weitere Informationen
   static var rat_conversion_info_title: String { return UBLocalized.tr(Key.rat_conversion_info_title) }
  /// Website der Nationalen Antragsstelle (ohne Datenübernahme)
   static var rat_conversion_link_antragsstelle: String { return UBLocalized.tr(Key.rat_conversion_link_antragsstelle) }
  /// Mehr erfahren
   static var rat_conversion_overview_button: String { return UBLocalized.tr(Key.rat_conversion_overview_button) }
  /// Für dieses Covid-Zertifikat kann eine EU-kompatible Version beantragt werden.
   static var rat_conversion_overview_text: String { return UBLocalized.tr(Key.rat_conversion_overview_text) }
  /// Neu: EU-kompatible Version
   static var rat_conversion_overview_title: String { return UBLocalized.tr(Key.rat_conversion_overview_title) }
  /// Neu werden Covid-Zertifikate für Genesene auf Basis von Antigen-Schnelltests auch in der EU akzeptiert.\n\nSie haben die Möglichkeit, eine EU-kompatible Version dieses Zertifikats bei der Nationalen Antragsstelle zu beantragen.
   static var rat_conversion_text: String { return UBLocalized.tr(Key.rat_conversion_text) }
  /// Covid-Zertifikat beantragen (EU-kompatibel)
   static var rat_conversion_title: String { return UBLocalized.tr(Key.rat_conversion_title) }
  /// Einstellungen
   static var settings_title: String { return UBLocalized.tr(Key.settings_title) }
  /// Covid-19
   static var target_disease_name: String { return UBLocalized.tr(Key.target_disease_name) }
  /// Die Nutzungsbedingungen und die Datenschutzerklärung der App wurden punktuell aktualisiert und an die rechtlichen Grundlagen angepasst.
   static var terms_and_conditions_update_boarding_text: String { return UBLocalized.tr(Key.terms_and_conditions_update_boarding_text) }
  /// Aktualisierung
   static var terms_and_conditions_update_boarding_title: String { return UBLocalized.tr(Key.terms_and_conditions_update_boarding_title) }
  /// Ein unbekannter Fehler ist aufgetreten.
   static var unknown_error: String { return UBLocalized.tr(Key.unknown_error) }
  /// Impftermin
   static var vaccination_appointment_header: String { return UBLocalized.tr(Key.vaccination_appointment_header) }
  /// Aargau
   static var vaccination_booking_ag_name: String { return UBLocalized.tr(Key.vaccination_booking_ag_name) }
  /// https://www.ag.ch/coronavirus-impfung
   static var vaccination_booking_ag_url: String { return UBLocalized.tr(Key.vaccination_booking_ag_url) }
  /// Appenzell Innerrhoden
   static var vaccination_booking_ai_name: String { return UBLocalized.tr(Key.vaccination_booking_ai_name) }
  /// https://www.ai.ch/coronavirus-impfung
   static var vaccination_booking_ai_url: String { return UBLocalized.tr(Key.vaccination_booking_ai_url) }
  /// Appenzell Ausserrhoden
   static var vaccination_booking_ar_name: String { return UBLocalized.tr(Key.vaccination_booking_ar_name) }
  /// https://www.ar.ch/verwaltung/departement-gesundheit-und-soziales/amt-fuer-gesundheit/informationsseite-coronavirus/coronaimpfung/
   static var vaccination_booking_ar_url: String { return UBLocalized.tr(Key.vaccination_booking_ar_url) }
  /// Bern
   static var vaccination_booking_be_name: String { return UBLocalized.tr(Key.vaccination_booking_be_name) }
  /// http://www.be.ch/corona-impfung
   static var vaccination_booking_be_url: String { return UBLocalized.tr(Key.vaccination_booking_be_url) }
  /// Basel-Landschaft
   static var vaccination_booking_bl_name: String { return UBLocalized.tr(Key.vaccination_booking_bl_name) }
  /// https://www.bl.ch/impfen
   static var vaccination_booking_bl_url: String { return UBLocalized.tr(Key.vaccination_booking_bl_url) }
  /// Basel-Stadt
   static var vaccination_booking_bs_name: String { return UBLocalized.tr(Key.vaccination_booking_bs_name) }
  /// http://www.coronaimpfzentrumbasel.ch
   static var vaccination_booking_bs_url: String { return UBLocalized.tr(Key.vaccination_booking_bs_url) }
  /// Freiburg
   static var vaccination_booking_fr_name: String { return UBLocalized.tr(Key.vaccination_booking_fr_name) }
  /// https://www.fr.ch/de/gesundheit/covid-19/covid-19-impfung-in-ihrer-naehe-durch-impfteams-in-den-impfzentren-in-der-apotheke-oder-bei-ihrem-arzt
   static var vaccination_booking_fr_url: String { return UBLocalized.tr(Key.vaccination_booking_fr_url) }
  /// Genf
   static var vaccination_booking_ge_name: String { return UBLocalized.tr(Key.vaccination_booking_ge_name) }
  /// https://www.ge.ch/se-faire-vacciner-contre-covid-19
   static var vaccination_booking_ge_url: String { return UBLocalized.tr(Key.vaccination_booking_ge_url) }
  /// Glarus
   static var vaccination_booking_gl_name: String { return UBLocalized.tr(Key.vaccination_booking_gl_name) }
  /// https://www.gl.ch/verwaltung/finanzen-und-gesundheit/gesundheit/coronavirus.html/4817#Impfung
   static var vaccination_booking_gl_url: String { return UBLocalized.tr(Key.vaccination_booking_gl_url) }
  /// Graubünden
   static var vaccination_booking_gr_name: String { return UBLocalized.tr(Key.vaccination_booking_gr_name) }
  /// https://www.gr.ch/DE/institutionen/verwaltung/djsg/ga/coronavirus/info/impfen/Seiten/impfen.aspx
   static var vaccination_booking_gr_url: String { return UBLocalized.tr(Key.vaccination_booking_gr_url) }
  /// Die Covid-19-Impfung ist für Personen ab 5 Jahren empfohlen.
   static var vaccination_booking_info_info: String { return UBLocalized.tr(Key.vaccination_booking_info_info) }
  /// Eine Impfung könnte zum Beispiel an diesen Orten in Ihrer Nähe stattfinden:\n\n- in spezifischen Impfzentren\n- in Spitälern\n- bei Ihrem Hausarzt oder Ihrer Hausärztin\n- in Impfapotheken\n\nViele Orte bieten auch Walk-in-Impfungen ohne Termine an.
   static var vaccination_booking_info_text: String { return UBLocalized.tr(Key.vaccination_booking_info_text) }
  /// Impftermin in Ihrer Nähe buchen
   static var vaccination_booking_info_title: String { return UBLocalized.tr(Key.vaccination_booking_info_title) }
  /// https://bag-coronavirus.ch/impfung/
   static var vaccination_booking_info_url: String { return UBLocalized.tr(Key.vaccination_booking_info_url) }
  /// Jura
   static var vaccination_booking_ju_name: String { return UBLocalized.tr(Key.vaccination_booking_ju_name) }
  /// https://www.jura.ch/fr/Autorites/Coronavirus/Vaccination.html
   static var vaccination_booking_ju_url: String { return UBLocalized.tr(Key.vaccination_booking_ju_url) }
  /// Luzern
   static var vaccination_booking_lu_name: String { return UBLocalized.tr(Key.vaccination_booking_lu_name) }
  /// http://www.lu.ch/covid_impfung
   static var vaccination_booking_lu_url: String { return UBLocalized.tr(Key.vaccination_booking_lu_url) }
  /// Neuenburg
   static var vaccination_booking_ne_name: String { return UBLocalized.tr(Key.vaccination_booking_ne_name) }
  /// https://www.ne.ch/autorites/DFS/SCSP/medecin-cantonal/maladies-vaccinations/covid-19-vaccination/Pages/accueil.aspx
   static var vaccination_booking_ne_url: String { return UBLocalized.tr(Key.vaccination_booking_ne_url) }
  /// Nidwalden
   static var vaccination_booking_nw_name: String { return UBLocalized.tr(Key.vaccination_booking_nw_name) }
  /// https://www.nw.ch/gesundheitsamtdienste/6044#Impfung
   static var vaccination_booking_nw_url: String { return UBLocalized.tr(Key.vaccination_booking_nw_url) }
  /// Obwalden
   static var vaccination_booking_ow_name: String { return UBLocalized.tr(Key.vaccination_booking_ow_name) }
  /// https://www.ow.ch/dienstleistungen/7129
   static var vaccination_booking_ow_url: String { return UBLocalized.tr(Key.vaccination_booking_ow_url) }
  /// St. Gallen
   static var vaccination_booking_sg_name: String { return UBLocalized.tr(Key.vaccination_booking_sg_name) }
  /// https://www.sg.ch/coronavirus/impfen
   static var vaccination_booking_sg_url: String { return UBLocalized.tr(Key.vaccination_booking_sg_url) }
  /// Schaffhausen
   static var vaccination_booking_sh_name: String { return UBLocalized.tr(Key.vaccination_booking_sh_name) }
  /// https://sh.ch/CMS/Webseite/Kanton-Schaffhausen/Beh-rde/Verwaltung/Departement-des-Innern/Gesundheitsamt-7126057-DE.html
   static var vaccination_booking_sh_url: String { return UBLocalized.tr(Key.vaccination_booking_sh_url) }
  /// Solothurn
   static var vaccination_booking_so_name: String { return UBLocalized.tr(Key.vaccination_booking_so_name) }
  /// https://so.ch/coronaimpfung
   static var vaccination_booking_so_url: String { return UBLocalized.tr(Key.vaccination_booking_so_url) }
  /// Schwyz
   static var vaccination_booking_sz_name: String { return UBLocalized.tr(Key.vaccination_booking_sz_name) }
  /// https://www.sz.ch/corona-impfen
   static var vaccination_booking_sz_url: String { return UBLocalized.tr(Key.vaccination_booking_sz_url) }
  /// Thurgau
   static var vaccination_booking_tg_name: String { return UBLocalized.tr(Key.vaccination_booking_tg_name) }
  /// https://gesundheit.tg.ch/aktuelles/impfung-fuer-covid-19.html/11590
   static var vaccination_booking_tg_url: String { return UBLocalized.tr(Key.vaccination_booking_tg_url) }
  /// Tessin
   static var vaccination_booking_ti_name: String { return UBLocalized.tr(Key.vaccination_booking_ti_name) }
  /// http://www.ti.ch/vaccinazione
   static var vaccination_booking_ti_url: String { return UBLocalized.tr(Key.vaccination_booking_ti_url) }
  /// Uri
   static var vaccination_booking_ur_name: String { return UBLocalized.tr(Key.vaccination_booking_ur_name) }
  /// https://www.ur.ch/themen/3673
   static var vaccination_booking_ur_url: String { return UBLocalized.tr(Key.vaccination_booking_ur_url) }
  /// Waadt
   static var vaccination_booking_vd_name: String { return UBLocalized.tr(Key.vaccination_booking_vd_name) }
  /// https://vd.ch/coronavirus-vaccins
   static var vaccination_booking_vd_url: String { return UBLocalized.tr(Key.vaccination_booking_vd_url) }
  /// Wallis
   static var vaccination_booking_vs_name: String { return UBLocalized.tr(Key.vaccination_booking_vs_name) }
  /// https://www.vs.ch/de/web/coronavirus#ancre_vaccination
   static var vaccination_booking_vs_url: String { return UBLocalized.tr(Key.vaccination_booking_vs_url) }
  /// Zug
   static var vaccination_booking_zg_name: String { return UBLocalized.tr(Key.vaccination_booking_zg_name) }
  /// https://www.corona-impfung-zug.ch/
   static var vaccination_booking_zg_url: String { return UBLocalized.tr(Key.vaccination_booking_zg_url) }
  /// Zürich
   static var vaccination_booking_zh_name: String { return UBLocalized.tr(Key.vaccination_booking_zh_name) }
  /// http://www.zh.ch/coronaimpfung
   static var vaccination_booking_zh_url: String { return UBLocalized.tr(Key.vaccination_booking_zh_url) }
  /// Wählen Sie Ihren Kanton
   static var vaccination_choose_your_canton: String { return UBLocalized.tr(Key.vaccination_choose_your_canton) }
  /// Mit der Covid-19-Impfung können Sie unbeschwert in die meisten Länder reisen.
   static var vaccination_hint_text_2: String { return UBLocalized.tr(Key.vaccination_hint_text_2) }
  /// Mit der Covid-19-Impfung können Sie sich vor Erkrankung und einem allfälligen schweren Verlauf schützen.
   static var vaccination_hint_text_3: String { return UBLocalized.tr(Key.vaccination_hint_text_3) }
  /// Mit der Covid-19-Impfung können Sie auf sichere Art immun werden.
   static var vaccination_hint_text_4: String { return UBLocalized.tr(Key.vaccination_hint_text_4) }
  /// Mit der Covid-19-Impfung können Sie mithelfen, die Krankheitslast zu reduzieren.
   static var vaccination_hint_text_5: String { return UBLocalized.tr(Key.vaccination_hint_text_5) }
  /// Mit der Covid-19-Impfung können Sie helfen, die Auswirkungen der Pandemie zu bekämpfen.
   static var vaccination_hint_text_6: String { return UBLocalized.tr(Key.vaccination_hint_text_6) }
  /// Mit der Covid-19-Impfung können Sie die Langzeitfolgen einer Covid-19-Erkrankung vermeiden.
   static var vaccination_hint_text_7: String { return UBLocalized.tr(Key.vaccination_hint_text_7) }
  /// Mit der Covid-19-Impfung können Sie dazu beitragen, das Gesundheitswesen zu entlasten.
   static var vaccination_hint_text_8: String { return UBLocalized.tr(Key.vaccination_hint_text_8) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_2: String { return UBLocalized.tr(Key.vaccination_hint_title_2) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_3: String { return UBLocalized.tr(Key.vaccination_hint_title_3) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_4: String { return UBLocalized.tr(Key.vaccination_hint_title_4) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_5: String { return UBLocalized.tr(Key.vaccination_hint_title_5) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_6: String { return UBLocalized.tr(Key.vaccination_hint_title_6) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_7: String { return UBLocalized.tr(Key.vaccination_hint_title_7) }
  /// Jetzt impfen lassen!
   static var vaccination_hint_title_8: String { return UBLocalized.tr(Key.vaccination_hint_title_8) }
  /// Impftermin buchen
   static var vaccination_homescreen_button_title: String { return UBLocalized.tr(Key.vaccination_homescreen_button_title) }
  /// Zum Impf-Check
   static var vaccination_impf_check_action: String { return UBLocalized.tr(Key.vaccination_impf_check_action) }
  /// Der Covid-19 Impf-Check gibt Auskunft über Erst- sowie Auffrischimpfungen und führt Sie zur entsprechenden Anlaufstelle in Ihrem Kanton.
   static var vaccination_impf_check_info_text: String { return UBLocalized.tr(Key.vaccination_impf_check_info_text) }
  /// Jetzt Termin buchen
   static var vaccination_impf_check_title: String { return UBLocalized.tr(Key.vaccination_impf_check_title) }
  /// https://covid19.impf-check.ch/
   static var vaccination_impf_check_url: String { return UBLocalized.tr(Key.vaccination_impf_check_url) }
  /// Informationen zur Impfung
   static var vaccination_information_button_in_certificate: String { return UBLocalized.tr(Key.vaccination_information_button_in_certificate) }
  /// Weitere Informationen rund um die Covid-19-Impfung
   static var vaccination_more_information_title: String { return UBLocalized.tr(Key.vaccination_more_information_title) }
  /// Für 2G+ nur in Kombination mit der Prüfung eines Covid-Zertifikats für Geimpfte oder Genesene zugelassen.
   static var verifier_2g_plus_info2g: String { return UBLocalized.tr(Key.verifier_2g_plus_info2g) }
  /// Für 2G+ nur in Kombination mit der Prüfung eines gültigen Testzertifikats zugelassen.
   static var verifier_2g_plus_infoplus: String { return UBLocalized.tr(Key.verifier_2g_plus_infoplus) }
  /// Gültiges Covid-Zertifikat nach 2G-Regelung
   static var verifier_2g_plus_success2g: String { return UBLocalized.tr(Key.verifier_2g_plus_success2g) }
  /// Gültiges Covid-Zertifikat für Getestete
   static var verifier_2g_plus_successplus: String { return UBLocalized.tr(Key.verifier_2g_plus_successplus) }
  /// market://details?id=ch.admin.bag.covidcertificate.verifier
   static var verifier_android_app_google_play_store_url: String { return UBLocalized.tr(Key.verifier_android_app_google_play_store_url) }
  /// Covid Check
   static var verifier_app_name: String { return UBLocalized.tr(Key.verifier_app_name) }
  /// COVID Certificate Check
   static var verifier_app_title: String { return UBLocalized.tr(Key.verifier_app_title) }
  /// http://itunes.apple.com/app/id1565917510
   static var verifier_apple_app_store_url: String { return UBLocalized.tr(Key.verifier_apple_app_store_url) }
  /// Gültigkeit des Zertifikats\nabgelaufen
   static var verifier_certificate_light_error_expired: String { return UBLocalized.tr(Key.verifier_certificate_light_error_expired) }
  /// Für Betriebe und Veranstaltungen, in welchen mit einer Regelung nach 2G+ geprüft wird.
   static var verifier_check_mode_info_2g_plus_text_1: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_plus_text_1) }
  /// Zusätzlich zu einem Covid-Zertifikat für Geimpfte oder Genesene wird ein gültiges Testzertifikat benötigt, welches separat geprüft werden muss.
   static var verifier_check_mode_info_2g_plus_text_2: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_plus_text_2) }
  /// Ausnahmen: Personen, deren vollständige Impfung, Auffrischimpfung oder Genesung nicht länger als 120 Tage zurückliegt.
   static var verifier_check_mode_info_2g_plus_text_3: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_plus_text_3) }
  /// Die Prüfung von Zertifikate Light ist in diesem Modus nicht möglich.
   static var verifier_check_mode_info_2g_plus_text_4: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_plus_text_4) }
  /// 2G+
   static var verifier_check_mode_info_2g_plus_title: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_plus_title) }
  /// Für Betriebe und Veranstaltungen, in welchen mit einer 2G-Regelung geprüft wird.
   static var verifier_check_mode_info_2g_text_1: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_text_1) }
  /// In diesem Modus werden Covid-Zertifikate für Geimpfte oder Genesene akzeptiert.
   static var verifier_check_mode_info_2g_text_2: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_text_2) }
  /// Die Prüfung von einem Zertifikat Light ist in diesem Modus nicht möglich.
   static var verifier_check_mode_info_2g_text_3: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_text_3) }
  /// 2G
   static var verifier_check_mode_info_2g_title: String { return UBLocalized.tr(Key.verifier_check_mode_info_2g_title) }
  /// Für Betriebe und Veranstaltungen, in welchen mit einer 3G-Regelung geprüft wird.
   static var verifier_check_mode_info_3g_text_1: String { return UBLocalized.tr(Key.verifier_check_mode_info_3g_text_1) }
  /// In diesem Modus werden Covid-Zertifikate für Geimpfte, Genesene oder negativ Getestete akzeptiert.
   static var verifier_check_mode_info_3g_text_2: String { return UBLocalized.tr(Key.verifier_check_mode_info_3g_text_2) }
  /// Die Prüfung von einem Zertifikat Light ist in diesem Modus möglich.
   static var verifier_check_mode_info_3g_text_3: String { return UBLocalized.tr(Key.verifier_check_mode_info_3g_text_3) }
  /// 3G
   static var verifier_check_mode_info_3g_title: String { return UBLocalized.tr(Key.verifier_check_mode_info_3g_title) }
  /// Für Bereiche, bei denen ein gültiges Testzertifikat notwendig ist.
   static var verifier_check_mode_info_test_cert_text_1: String { return UBLocalized.tr(Key.verifier_check_mode_info_test_cert_text_1) }
  /// In diesem Modus werden Covid-Zertifikate für negativ Getestete basierend auf einem PCR- oder Antigen-Schnelltest akzeptiert.
   static var verifier_check_mode_info_test_cert_text_2: String { return UBLocalized.tr(Key.verifier_check_mode_info_test_cert_text_2) }
  /// Die Prüfung von Zertifikate Light ist in diesem Modus nicht möglich.
   static var verifier_check_mode_info_test_cert_text_3: String { return UBLocalized.tr(Key.verifier_check_mode_info_test_cert_text_3) }
  /// Testzertifikat
   static var verifier_check_mode_info_test_cert_title: String { return UBLocalized.tr(Key.verifier_check_mode_info_test_cert_title) }
  /// Wählen Sie den Prüfmodus, in welchem Sie Covid-Zertifikate prüfen möchten.
   static var verifier_check_mode_info_unselected_text_1: String { return UBLocalized.tr(Key.verifier_check_mode_info_unselected_text_1) }
  /// Der Prüfmodus kann jederzeit geändert werden.
   static var verifier_check_mode_info_unselected_text_2: String { return UBLocalized.tr(Key.verifier_check_mode_info_unselected_text_2) }
  /// wählen
   static var verifier_choose_mode_button_title: String { return UBLocalized.tr(Key.verifier_choose_mode_button_title) }
  /// Geburtsdatum
   static var verifier_covid_certificate_birthdate: String { return UBLocalized.tr(Key.verifier_covid_certificate_birthdate) }
  /// Nachname
   static var verifier_covid_certificate_name: String { return UBLocalized.tr(Key.verifier_covid_certificate_name) }
  /// Vorname
   static var verifier_covid_certificate_prename: String { return UBLocalized.tr(Key.verifier_covid_certificate_prename) }
  /// Zum App Store
   static var verifier_error_app_store_button: String { return UBLocalized.tr(Key.verifier_error_app_store_button) }
  /// Die Prüfung dieser Art des Covid-Zertifikats bedingt die neuste Version der Check-App. Bitte aktualisieren Sie Ihre App und wiederholen Sie den Prüfvorgang.
   static var verifier_error_app_store_text: String { return UBLocalized.tr(Key.verifier_error_app_store_text) }
  /// Das Format des Covid-Zertifikats ist ungültig.
   static var verifier_error_invalid_format: String { return UBLocalized.tr(Key.verifier_error_invalid_format) }
  /// Ihr gewählter Prüfmodus existiert nicht mehr.
   static var verifier_error_mode_no_longer_exists: String { return UBLocalized.tr(Key.verifier_error_mode_no_longer_exists) }
  /// Um ein Covid-Zertifikat zu prüfen, scannen Sie den QR-Code auf dem Papierzertifikat oder in der vorgewiesenen COVID Certificate App mit der dafür vorgesehenen COVID Certificate Check App.
   static var verifier_faq_works_answer_1: String { return UBLocalized.tr(Key.verifier_faq_works_answer_1) }
  /// Beim Scannen werden drei Aspekte geprüft:\n– Enthält das Zertifikat eine gültige elektronische Signatur?\n– Ist das Zertifikat nicht widerrufen worden?\n– Entspricht das Zertifikat den Gültigkeitskriterien der Schweiz?\n\nWenn alle drei Aspekte positiv bewertet werden, wird das Covid-Zertifikat als gültig ausgewiesen.
   static var verifier_faq_works_answer_2: String { return UBLocalized.tr(Key.verifier_faq_works_answer_2) }
  /// Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
   static var verifier_faq_works_answer_2_1: String { return UBLocalized.tr(Key.verifier_faq_works_answer_2_1) }
  /// Neben Pass oder ID werden auch andere Ausweisdokumente akzeptiert, die die Identität der betreffenden Person mit einem Foto belegen (z.B. Führerausweis). Das Covid-Zertifikat ist zwar fälschungssicher, mit der Überprüfung der Personalien wird aber erst sichergestellt, dass das vorgezeigte Zertifikat auch auf den Vorweisenden ausgestellt wurde.
   static var verifier_faq_works_answer_3: String { return UBLocalized.tr(Key.verifier_faq_works_answer_3) }
  /// Ja, Covid-Zertifikate, die mit dem digitalen COVID-Zertifikat der EU kompatibel sind, können mit der COVID Certificate Check App gegen die Gültigkeitskriterien der Schweiz geprüft werden.
   static var verifier_faq_works_answer_4: String { return UBLocalized.tr(Key.verifier_faq_works_answer_4) }
  /// Beim Prüfvorgang sehen Sie nur den Namen und das Geburtsdatum der Zertifikatsinhaberin oder des Zertifikatsinhabers und ob das Covid-Zertifikat gültig ist.
   static var verifier_faq_works_answer_5: String { return UBLocalized.tr(Key.verifier_faq_works_answer_5) }
  /// Nein, beim Prüfvorgang werden keine Daten gespeichert - weder in der COVID Certificate Check App noch in einem zentralen System. Es ist somit nicht möglich nachzuvollziehen, welches Covid-Zertifikat von wem, wann und wo überprüft wurde.
   static var verifier_faq_works_answer_6: String { return UBLocalized.tr(Key.verifier_faq_works_answer_6) }
  /// Grundsätzlich können Covid-Zertifikate auch ohne eine Internetverbindung geprüft werden. Dazu werden regelmässig aktualisierte Prüflisten von einem zentralen Server heruntergeladen. Diese lokal gespeicherten Prüflisten dürfen nicht älter als 48h sein. \n\nUm die Prüflisten zu aktualisieren muss die App mit dem Internet verbunden sein und geöffnet werden. Die Aktualisierung erfolgt unmittelbar und automatisch.
   static var verifier_faq_works_answer_7: String { return UBLocalized.tr(Key.verifier_faq_works_answer_7) }
  /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
   static var verifier_faq_works_answer_8: String { return UBLocalized.tr(Key.verifier_faq_works_answer_8) }
  /// Das Zertifikat Light kann durch die Halterin / den Halter jederzeit in der «COVID Certificate»-App deaktiviert werden. Danach steht das normale Covid-Zertifikat wieder zur Verfügung.
   static var verifier_faq_works_answer_9: String { return UBLocalized.tr(Key.verifier_faq_works_answer_9) }
  /// Erklärvideo
   static var verifier_faq_works_linktext_1: String { return UBLocalized.tr(Key.verifier_faq_works_linktext_1) }
  /// Weitere Informationen
   static var verifier_faq_works_linktext_2_1: String { return UBLocalized.tr(Key.verifier_faq_works_linktext_2_1) }
  /// https://youtu.be/DClLZIUjr3w
   static var verifier_faq_works_linkurl_1: String { return UBLocalized.tr(Key.verifier_faq_works_linkurl_1) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/covid-zertifikat.html#-837133624
   static var verifier_faq_works_linkurl_2_1: String { return UBLocalized.tr(Key.verifier_faq_works_linkurl_2_1) }
  /// Wie können Covid-Zertifikate geprüft werden?
   static var verifier_faq_works_question_1: String { return UBLocalized.tr(Key.verifier_faq_works_question_1) }
  /// Was wird genau geprüft?
   static var verifier_faq_works_question_2: String { return UBLocalized.tr(Key.verifier_faq_works_question_2) }
  /// Was sind die aktuellen Gültigkeitskriterien der Schweiz?
   static var verifier_faq_works_question_2_1: String { return UBLocalized.tr(Key.verifier_faq_works_question_2_1) }
  /// Welche Ausweisdokumente sind gültig? Weshalb müssen die Personalien überprüft werden?
   static var verifier_faq_works_question_3: String { return UBLocalized.tr(Key.verifier_faq_works_question_3) }
  /// Können auch ausländische Zertifikate geprüft werden?
   static var verifier_faq_works_question_4: String { return UBLocalized.tr(Key.verifier_faq_works_question_4) }
  /// Welche Daten sehe ich beim Prüfvorgang?
   static var verifier_faq_works_question_5: String { return UBLocalized.tr(Key.verifier_faq_works_question_5) }
  /// Werden beim Prüfvorgang in der COVID Certificate Check App oder in einem zentralen System Daten gespeichert?
   static var verifier_faq_works_question_6: String { return UBLocalized.tr(Key.verifier_faq_works_question_6) }
  /// Können Zertifikate auch offline geprüft werden?
   static var verifier_faq_works_question_7: String { return UBLocalized.tr(Key.verifier_faq_works_question_7) }
  /// Was ist das Zertifikat Light?
   static var verifier_faq_works_question_8: String { return UBLocalized.tr(Key.verifier_faq_works_question_8) }
  /// Wie kann ein Zertifikat Light wieder in ein EU/EFTA-konformes Covid-Zertifikat umgewandelt werden?
   static var verifier_faq_works_question_9: String { return UBLocalized.tr(Key.verifier_faq_works_question_9) }
  /// Mit der COVID Certificate Check App können QR-Codes auf Covid-Zertifikaten gescannt und die Zertifikate auf Echtheit und Gültigkeit überprüft werden.
   static var verifier_faq_works_subtitle: String { return UBLocalized.tr(Key.verifier_faq_works_subtitle) }
  /// So werden Covid-Zertifikate geprüft
   static var verifier_faq_works_title: String { return UBLocalized.tr(Key.verifier_faq_works_title) }
  /// Covid Certificate
   static var verifier_homescreen_header_title: String { return UBLocalized.tr(Key.verifier_homescreen_header_title) }
  /// Vorgewiesenes Zertifikat scannen
   static var verifier_homescreen_pager_description_1: String { return UBLocalized.tr(Key.verifier_homescreen_pager_description_1) }
  /// Zertifikate werden automatisch geprüft
   static var verifier_homescreen_pager_description_2: String { return UBLocalized.tr(Key.verifier_homescreen_pager_description_2) }
  /// Prüfen
   static var verifier_homescreen_scan_button: String { return UBLocalized.tr(Key.verifier_homescreen_scan_button) }
  /// Prüfen ({MODE})
   static var verifier_homescreen_scan_button_with_mode: String { return UBLocalized.tr(Key.verifier_homescreen_scan_button_with_mode) }
  /// So funktioniert's
   static var verifier_homescreen_support_button: String { return UBLocalized.tr(Key.verifier_homescreen_support_button) }
  /// Check
   static var verifier_homescreen_title: String { return UBLocalized.tr(Key.verifier_homescreen_title) }
  /// Prüfmodus
   static var verifier_mode_title: String { return UBLocalized.tr(Key.verifier_mode_title) }
  /// Ein unerwarteter Fehler ist aufgetreten.
   static var verifier_network_error_text: String { return UBLocalized.tr(Key.verifier_network_error_text) }
  /// Prüfung fehlgeschlagen
   static var verifier_network_error_title: String { return UBLocalized.tr(Key.verifier_network_error_title) }
  /// Eine Internetverbindung wird benötigt, um die Prüflisten zu aktualisieren
   static var verifier_offline_error_text: String { return UBLocalized.tr(Key.verifier_offline_error_text) }
  /// Offline-Prüfung nicht möglich
   static var verifier_offline_error_title: String { return UBLocalized.tr(Key.verifier_offline_error_title) }
  /// Externer Hardwarescanner erkannt
   static var verifier_qr_scanner_external_hardware_detected: String { return UBLocalized.tr(Key.verifier_qr_scanner_external_hardware_detected) }
  /// QR-Code scannen\nzum Prüfen
   static var verifier_qr_scanner_scan_qr_text: String { return UBLocalized.tr(Key.verifier_qr_scanner_scan_qr_text) }
  /// Das Gerät befindet sich im Flugmodus.
   static var verifier_retry_flightmode_error: String { return UBLocalized.tr(Key.verifier_retry_flightmode_error) }
  /// Ein Netzwerkfehler ist aufgetreten.
   static var verifier_retry_network_error: String { return UBLocalized.tr(Key.verifier_retry_network_error) }
  /// So funktioniert's
   static var verifier_support_header: String { return UBLocalized.tr(Key.verifier_support_header) }
  /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-check-app.html
   static var verifier_terms_privacy_link: String { return UBLocalized.tr(Key.verifier_terms_privacy_link) }
  /// Prüfen
   static var verifier_title_qr_scan: String { return UBLocalized.tr(Key.verifier_title_qr_scan) }
  /// Mit diesem Update können Sie in der App auch die Zertifikatskopie ohne Gesundheitsdaten prüfen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
   static var verifier_update_boarding_certificate_light_text: String { return UBLocalized.tr(Key.verifier_update_boarding_certificate_light_text) }
  /// Zertifikat Light
   static var verifier_update_boarding_certificate_light_title: String { return UBLocalized.tr(Key.verifier_update_boarding_certificate_light_title) }
  /// Update
   static var verifier_update_boarding_header: String { return UBLocalized.tr(Key.verifier_update_boarding_header) }
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDie Gültigkeit des Zertifikat ist abgelaufen.
   static var verifier_verifiy_error_expired: String { return UBLocalized.tr(Key.verifier_verifiy_error_expired) }
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz.\n\nDas Zertifikat ist noch nicht gültig.
   static var verifier_verifiy_error_notyetvalid: String { return UBLocalized.tr(Key.verifier_verifiy_error_notyetvalid) }
  /// Das Covid-Zertifikat wurde widerrufen
   static var verifier_verify_error_info_for_blacklist: String { return UBLocalized.tr(Key.verifier_verify_error_info_for_blacklist) }
  /// Das Covid-Zertifikat hat keine gültige Signatur
   static var verifier_verify_error_info_for_certificate_invalid: String { return UBLocalized.tr(Key.verifier_verify_error_info_for_certificate_invalid) }
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz oder des Prüfmodus ({MODUS})
   static var verifier_verify_error_info_for_national_rules: String { return UBLocalized.tr(Key.verifier_verify_error_info_for_national_rules) }
  /// Ein unerwarteter Fehler ist aufgetreten.
   static var verifier_verify_error_list_info_text: String { return UBLocalized.tr(Key.verifier_verify_error_list_info_text) }
  /// Prüfung fehlgeschlagen
   static var verifier_verify_error_list_title: String { return UBLocalized.tr(Key.verifier_verify_error_list_title) }
  /// Covid-Zertifikat ungültig
   static var verifier_verify_error_title: String { return UBLocalized.tr(Key.verifier_verify_error_title) }
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz.
   static var verifier_verify_error_validity_range_bold: String { return UBLocalized.tr(Key.verifier_verify_error_validity_range_bold) }
  /// Die Prüfung kann in diesem Fall nur erfolgen, wenn die Umwandlung in ein Zertifikat Light rückgängig gemacht wird.
   static var verifier_verify_light_not_supported_by_mode_text: String { return UBLocalized.tr(Key.verifier_verify_light_not_supported_by_mode_text) }
  /// Beim zu prüfenden Covid-Zertifikat handelt es sich um ein Zertifikat Light. Dies kann im {MODUS}-Prüfmodus nicht geprüft werden.
   static var verifier_verify_light_not_supported_by_mode_title: String { return UBLocalized.tr(Key.verifier_verify_light_not_supported_by_mode_title) }
  /// Zertifikat wird geprüft
   static var verifier_verify_loading_text: String { return UBLocalized.tr(Key.verifier_verify_loading_text) }
  /// Nur mit einem Ausweisdokument \n& innerhalb der Schweiz gültig
   static var verifier_verify_success_certificate_light_info: String { return UBLocalized.tr(Key.verifier_verify_success_certificate_light_info) }
  /// Nur mit einem \nAusweisdokument gültig
   static var verifier_verify_success_info: String { return UBLocalized.tr(Key.verifier_verify_success_info) }
  /// Nicht widerrufen
   static var verifier_verify_success_info_for_blacklist: String { return UBLocalized.tr(Key.verifier_verify_success_info_for_blacklist) }
  /// Signatur gültig
   static var verifier_verify_success_info_for_certificate_valid: String { return UBLocalized.tr(Key.verifier_verify_success_info_for_certificate_valid) }
  /// Prüfung erfolgreich
   static var verifier_verify_success_title: String { return UBLocalized.tr(Key.verifier_verify_success_title) }
  /// Noch {TIMESPAN} gültig
   static var wallet_accessibility_light_certificate_expiration_timer: String { return UBLocalized.tr(Key.wallet_accessibility_light_certificate_expiration_timer) }
  /// Hinzufügen
   static var wallet_add_certificate: String { return UBLocalized.tr(Key.wallet_add_certificate) }
  /// Hinzufügen
   static var wallet_add_certificate_button: String { return UBLocalized.tr(Key.wallet_add_certificate_button) }
  /// market://details?id=ch.admin.bag.covidcertificate.wallet
   static var wallet_android_app_google_play_store_url: String { return UBLocalized.tr(Key.wallet_android_app_google_play_store_url) }
  /// Covid Cert
   static var wallet_app_name: String { return UBLocalized.tr(Key.wallet_app_name) }
  /// http://itunes.apple.com/app/id1565917320
   static var wallet_apple_app_store_url: String { return UBLocalized.tr(Key.wallet_apple_app_store_url) }
  /// Covid-Zertifikat
   static var wallet_certificate: String { return UBLocalized.tr(Key.wallet_certificate) }
  /// Dieses Zertifikat ist bereits in der App gespeichert
   static var wallet_certificate_already_exists: String { return UBLocalized.tr(Key.wallet_certificate_already_exists) }
  /// Datum des ersten positiven Resultats
   static var wallet_certificate_antigen_positive_date: String { return UBLocalized.tr(Key.wallet_certificate_antigen_positive_date) }
  /// Medizinisches Attest ausgestellt in
   static var wallet_certificate_ausnahme_issued_country: String { return UBLocalized.tr(Key.wallet_certificate_ausnahme_issued_country) }
  /// Für die Ausstellung verantwortliche Stelle
   static var wallet_certificate_ausnahme_responsible_issuer: String { return UBLocalized.tr(Key.wallet_certificate_ausnahme_responsible_issuer) }
  /// Beginn der Gültigkeit
   static var wallet_certificate_ausnahme_test_attest_start_date: String { return UBLocalized.tr(Key.wallet_certificate_ausnahme_test_attest_start_date) }
  /// Zertifikat erstellt am\n{DATE}
   static var wallet_certificate_date: String { return UBLocalized.tr(Key.wallet_certificate_date) }
  /// Wollen Sie das Zertifikat wirklich löschen?
   static var wallet_certificate_delete_confirm_text: String { return UBLocalized.tr(Key.wallet_certificate_delete_confirm_text) }
  /// Zertifikat Light
   static var wallet_certificate_detail_certificate_light_button: String { return UBLocalized.tr(Key.wallet_certificate_detail_certificate_light_button) }
  /// Date format used: dd.mm.yyyy
   static var wallet_certificate_detail_date_format_info: String { return UBLocalized.tr(Key.wallet_certificate_detail_date_format_info) }
  /// Exportieren
   static var wallet_certificate_detail_export_button: String { return UBLocalized.tr(Key.wallet_certificate_detail_export_button) }
  /// Dieses Zertifikat ist kein Reisedokument. \n<br /><br />\nDie wissenschaftlichen Erkenntnisse über Covid-19-Impfungen und -Tests sowie über die Genesung von einer Covid-19-Infektion entwickeln sich ständig weiter, auch im Hinblick auf neue besorgniserregende Virusvarianten. \n<br /><br />\nBitte informieren Sie sich vor einer Reise über die am Zielort geltenden Beschränkungen und Gültigkeitsregeln. Die Gültigkeit Ihres Zertifikats wird im Ausland anhand der Regeln des Ziellandes berechnet. Diese kann von der in der «COVID Certificate»-App angegebenen Schweizer Gültigkeit abweichen. Mehr Informationen dazu erhalten Sie <a href="https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/was-soll-ich-tun-wenn-mein-covid-zertifikat-nach-schweizer-gueltigkeitsregeln-bald">in dieser FAQ</a>.
   static var wallet_certificate_detail_note: String { return UBLocalized.tr(Key.wallet_certificate_detail_note) }
  /// Dieses Zertifikat ist kein Reisedokument. \n<br /><br />\nDieses Zertifikat ist zeitlich nur begrenzt gültig. Die aktuell in der Schweiz massgebliche Gültigkeitsdauer können Sie jederzeit mit der Covid-Certificate App überprüfen.
   static var wallet_certificate_detail_note_ausnahme: String { return UBLocalized.tr(Key.wallet_certificate_detail_note_ausnahme) }
  /// Dieses Zertifikat ist kein Reisedokument.\n<br /><br />\nDieses Zertifikat ist zeitlich nur begrenzt gültig. Die aktuell in der Schweiz massgebliche Gültigkeitsdauer können Sie jederzeit mit der Covid-Certificate App überprüfen.
   static var wallet_certificate_detail_note_positive_antigen: String { return UBLocalized.tr(Key.wallet_certificate_detail_note_positive_antigen) }
  /// Nachweis erstellt am\n{DATE}
   static var wallet_certificate_evidence_creation_date: String { return UBLocalized.tr(Key.wallet_certificate_evidence_creation_date) }
  /// Nachweis
   static var wallet_certificate_evidence_title: String { return UBLocalized.tr(Key.wallet_certificate_evidence_title) }
  /// Exportieren
   static var wallet_certificate_export_button: String { return UBLocalized.tr(Key.wallet_certificate_export_button) }
  /// PDF konnte nicht\nerstellt werden
   static var wallet_certificate_export_detail_error_title: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_error_title) }
  /// Exportieren
   static var wallet_certificate_export_detail_export_button: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_export_button) }
  /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
   static var wallet_certificate_export_detail_general_error_text: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_general_error_text) }
  /// Ein unerwarteter Fehler ist aufgetreten.
   static var wallet_certificate_export_detail_general_error_title: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_general_error_title) }
  /// Um das PDF erstellen zu können, muss die App online sein.
   static var wallet_certificate_export_detail_network_error_text: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_network_error_text) }
  /// Keine Verbindung zum Internet
   static var wallet_certificate_export_detail_network_error_title: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_network_error_title) }
  /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
   static var wallet_certificate_export_detail_summary_1: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_summary_1) }
  /// Die Erstellung des PDF-Dokuments erfolgt online.
   static var wallet_certificate_export_detail_summary_2: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_summary_2) }
  /// Exportieren
   static var wallet_certificate_export_detail_title: String { return UBLocalized.tr(Key.wallet_certificate_export_detail_title) }
  /// Aus den Daten Ihres Covid-Zertifikats wird ein PDF erstellt, das Sie drucken oder teilen können.
   static var wallet_certificate_export_summary_1: String { return UBLocalized.tr(Key.wallet_certificate_export_summary_1) }
  /// Die Erstellung des PDF-Dokuments erfolgt online.
   static var wallet_certificate_export_summary_2: String { return UBLocalized.tr(Key.wallet_certificate_export_summary_2) }
  /// Covid-Zertifikat exportieren
   static var wallet_certificate_export_title: String { return UBLocalized.tr(Key.wallet_certificate_export_title) }
  /// UVCI
   static var wallet_certificate_identifier: String { return UBLocalized.tr(Key.wallet_certificate_identifier) }
  /// Impfdosis
   static var wallet_certificate_impfdosis_title: String { return UBLocalized.tr(Key.wallet_certificate_impfdosis_title) }
  /// Hersteller
   static var wallet_certificate_impfstoff_holder: String { return UBLocalized.tr(Key.wallet_certificate_impfstoff_holder) }
  /// Produkt
   static var wallet_certificate_impfstoff_product_name_title: String { return UBLocalized.tr(Key.wallet_certificate_impfstoff_product_name_title) }
  /// Aktivieren
   static var wallet_certificate_light_detail_activate_button: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_activate_button) }
  /// Zertifikat Light\nkonnte nicht aktiviert werden
   static var wallet_certificate_light_detail_activation_error: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_activation_error) }
  /// Versuchen Sie es später erneut.
   static var wallet_certificate_light_detail_activation_general_error_text: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_activation_general_error_text) }
  /// Ein unerwarteter Fehler ist aufgetreten.
   static var wallet_certificate_light_detail_activation_general_error_title: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_activation_general_error_title) }
  /// Um das Zertifikat Light aktivieren zu können, muss die App online sein.
   static var wallet_certificate_light_detail_activation_network_error_text: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_activation_network_error_text) }
  /// Keine Verbindung zum Internet
   static var wallet_certificate_light_detail_activation_network_error_title: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_activation_network_error_title) }
  /// Deaktivieren
   static var wallet_certificate_light_detail_deactivate_button: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_deactivate_button) }
  /// Kann nur innerhalb der Schweiz verwendet werden
   static var wallet_certificate_light_detail_summary_1: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_summary_1) }
  /// Enthält nur Namen, Vornamen, Geburtsdatum und eine elektronische Signatur
   static var wallet_certificate_light_detail_summary_2: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_summary_2) }
  /// Gültig für max. {LIGHT_CERT_VALIDITY_IN_H} Stunden
   static var wallet_certificate_light_detail_summary_3: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_summary_3) }
  /// Die Konvertierung des Covid-Zertifikats in ein Zertifikat Light erfolgt online.
   static var wallet_certificate_light_detail_summary_4: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_summary_4) }
  /// Sie können das Zertifikat Light jederzeit deaktivieren, um wieder zum normalen Covid-Zertifikat zu wechseln.
   static var wallet_certificate_light_detail_summary_5: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_summary_5) }
  /// Zertifikat Light
   static var wallet_certificate_light_detail_summary_title: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_summary_title) }
  /// Wenn Sie das Zertifikat Light aktivieren, wird aus den Daten Ihres Covid-Zertifikats ein neuer QR-Code erstellt, der keine Gesundheitsdaten enthält.
   static var wallet_certificate_light_detail_text_1: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_text_1) }
  /// Während das normale Covid-Zertifikat im Rahmen seiner Gültigkeit ohne Einschränkungen sowohl in der Schweiz als auch in der EU/EFTA verwendet werden kann, ist der Einsatz des Zertifikats Light nur in der Schweiz möglich. Aus Datenschutzgründen muss das Zertifikat Light nach {LIGHT_CERT_VALIDITY_IN_H} Stunden erneut aktiviert werden. Es bringt keine zusätzlichen Rechte gegenüber dem normalen Covid-Zertifikat.
   static var wallet_certificate_light_detail_text_2: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_text_2) }
  /// nur muss keine
   static var wallet_certificate_light_detail_text_2_bold: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_text_2_bold) }
  /// Was ist ein \nZertifikat Light?
   static var wallet_certificate_light_detail_title: String { return UBLocalized.tr(Key.wallet_certificate_light_detail_title) }
  /// Das Zertifikat Light wurde in den letzten 24h bereits zu oft aktiviert.
   static var wallet_certificate_light_rate_limit_text: String { return UBLocalized.tr(Key.wallet_certificate_light_rate_limit_text) }
  /// 24h-Limite erreicht
   static var wallet_certificate_light_rate_limit_title: String { return UBLocalized.tr(Key.wallet_certificate_light_rate_limit_title) }
  /// Zertifikat Light
   static var wallet_certificate_light_title: String { return UBLocalized.tr(Key.wallet_certificate_light_title) }
  /// Light
   static var wallet_certificate_list_light_certificate_badge: String { return UBLocalized.tr(Key.wallet_certificate_list_light_certificate_badge) }
  /// Zertifikate
   static var wallet_certificate_list_title: String { return UBLocalized.tr(Key.wallet_certificate_list_title) }
  /// QR code expiration date (technical)\n{DATE}
   static var wallet_certificate_qr_code_expiration_date: String { return UBLocalized.tr(Key.wallet_certificate_qr_code_expiration_date) }
  /// Datum des ersten positiven Resultats
   static var wallet_certificate_recovery_first_positiv_result: String { return UBLocalized.tr(Key.wallet_certificate_recovery_first_positiv_result) }
  /// Gültig ab
   static var wallet_certificate_recovery_from: String { return UBLocalized.tr(Key.wallet_certificate_recovery_from) }
  /// Gültig bis
   static var wallet_certificate_recovery_until: String { return UBLocalized.tr(Key.wallet_certificate_recovery_until) }
  /// QR-Code erneuern
   static var wallet_certificate_renew_now_button: String { return UBLocalized.tr(Key.wallet_certificate_renew_now_button) }
  /// Zur FAQ
   static var wallet_certificate_renewal_faq_link_text: String { return UBLocalized.tr(Key.wallet_certificate_renewal_faq_link_text) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/wieso-soll-ich-den-qr-code-meines-covid-zertifikats-erneuern-obwohl-das-zertifikat
   static var wallet_certificate_renewal_faq_link_url: String { return UBLocalized.tr(Key.wallet_certificate_renewal_faq_link_url) }
  /// Versuchen Sie es später erneut.
   static var wallet_certificate_renewal_general_error_text: String { return UBLocalized.tr(Key.wallet_certificate_renewal_general_error_text) }
  /// Ein unerwarteter Fehler ist aufgetreten.
   static var wallet_certificate_renewal_general_error_title: String { return UBLocalized.tr(Key.wallet_certificate_renewal_general_error_title) }
  /// QR-Code wird erneuert
   static var wallet_certificate_renewal_in_progress_info: String { return UBLocalized.tr(Key.wallet_certificate_renewal_in_progress_info) }
  /// Um den QR-Code erneuern zu können, muss die App online sein.
   static var wallet_certificate_renewal_offline_error_text: String { return UBLocalized.tr(Key.wallet_certificate_renewal_offline_error_text) }
  /// Keine Verbindung zum Internet
   static var wallet_certificate_renewal_offline_error_title: String { return UBLocalized.tr(Key.wallet_certificate_renewal_offline_error_title) }
  /// Ablaufdatum QR Code
   static var wallet_certificate_renewal_qr_code_expiration: String { return UBLocalized.tr(Key.wallet_certificate_renewal_qr_code_expiration) }
  /// QR-Code zu oft erneuert. Erneuerung temporär gesperrt.
   static var wallet_certificate_renewal_rate_limit_error_text: String { return UBLocalized.tr(Key.wallet_certificate_renewal_rate_limit_error_text) }
  /// 24h-Limite erreicht
   static var wallet_certificate_renewal_rate_limit_error_title: String { return UBLocalized.tr(Key.wallet_certificate_renewal_rate_limit_error_title) }
  /// Mehr erfahren
   static var wallet_certificate_renewal_required_bubble_button: String { return UBLocalized.tr(Key.wallet_certificate_renewal_required_bubble_button) }
  /// Um dieses Zertifikat weiterhin verwenden zu können, muss der QR-Code erneuert werden.
   static var wallet_certificate_renewal_required_bubble_text: String { return UBLocalized.tr(Key.wallet_certificate_renewal_required_bubble_text) }
  /// QR-Code erneuern
   static var wallet_certificate_renewal_required_bubble_title: String { return UBLocalized.tr(Key.wallet_certificate_renewal_required_bubble_title) }
  /// Das technische Ablaufdatum für diesen QR-Code ist (bald) erreicht. 
   static var wallet_certificate_renewal_required_info: String { return UBLocalized.tr(Key.wallet_certificate_renewal_required_info) }
  /// Mehr erfahren
   static var wallet_certificate_renewal_successful_bubble_button: String { return UBLocalized.tr(Key.wallet_certificate_renewal_successful_bubble_button) }
  /// Ersetzen Sie auch ausgedruckte oder gespeicherte Versionen dieses Zertifikats durch diese erneuerte Version.
   static var wallet_certificate_renewal_successful_bubble_text: String { return UBLocalized.tr(Key.wallet_certificate_renewal_successful_bubble_text) }
  /// Erfolgreich erneuert
   static var wallet_certificate_renewal_successful_bubble_title: String { return UBLocalized.tr(Key.wallet_certificate_renewal_successful_bubble_title) }
  /// Der QR-Code wurde erfolgreich erneuert
   static var wallet_certificate_renewal_successful_info: String { return UBLocalized.tr(Key.wallet_certificate_renewal_successful_info) }
  /// Krankheit oder Erreger
   static var wallet_certificate_target_disease_title: String { return UBLocalized.tr(Key.wallet_certificate_target_disease_title) }
  /// Testcenter
   static var wallet_certificate_test_done_by: String { return UBLocalized.tr(Key.wallet_certificate_test_done_by) }
  /// Hersteller
   static var wallet_certificate_test_holder: String { return UBLocalized.tr(Key.wallet_certificate_test_holder) }
  /// Hersteller und Name
   static var wallet_certificate_test_holder_and_name: String { return UBLocalized.tr(Key.wallet_certificate_test_holder_and_name) }
  /// Land des Tests
   static var wallet_certificate_test_land: String { return UBLocalized.tr(Key.wallet_certificate_test_land) }
  /// Name
   static var wallet_certificate_test_name: String { return UBLocalized.tr(Key.wallet_certificate_test_name) }
  /// Datum Resultat
   static var wallet_certificate_test_result_date_title: String { return UBLocalized.tr(Key.wallet_certificate_test_result_date_title) }
  /// Nicht erkannt (Negativ)
   static var wallet_certificate_test_result_negativ: String { return UBLocalized.tr(Key.wallet_certificate_test_result_negativ) }
  /// Erkannt (Positiv)
   static var wallet_certificate_test_result_positiv: String { return UBLocalized.tr(Key.wallet_certificate_test_result_positiv) }
  /// Ergebnis
   static var wallet_certificate_test_result_title: String { return UBLocalized.tr(Key.wallet_certificate_test_result_title) }
  /// Datum der Probenentnahme
   static var wallet_certificate_test_sample_date_title: String { return UBLocalized.tr(Key.wallet_certificate_test_sample_date_title) }
  /// Typ
   static var wallet_certificate_test_type: String { return UBLocalized.tr(Key.wallet_certificate_test_type) }
  /// Unvollständige Impfung
   static var wallet_certificate_type_incomplete_vaccine: String { return UBLocalized.tr(Key.wallet_certificate_type_incomplete_vaccine) }
  /// Land der Impfung
   static var wallet_certificate_vaccination_country_title: String { return UBLocalized.tr(Key.wallet_certificate_vaccination_country_title) }
  /// Impfdatum
   static var wallet_certificate_vaccination_date_title: String { return UBLocalized.tr(Key.wallet_certificate_vaccination_date_title) }
  /// Herausgeber
   static var wallet_certificate_vaccination_issuer_title: String { return UBLocalized.tr(Key.wallet_certificate_vaccination_issuer_title) }
  /// Art des Impfstoffs
   static var wallet_certificate_vaccine_prophylaxis: String { return UBLocalized.tr(Key.wallet_certificate_vaccine_prophylaxis) }
  /// In der Schweiz gültig ab:\n{DATE}
   static var wallet_certificate_valid_from: String { return UBLocalized.tr(Key.wallet_certificate_valid_from) }
  /// bis
   static var wallet_certificate_valid_until: String { return UBLocalized.tr(Key.wallet_certificate_valid_until) }
  /// Gültigkeit in der\nSchweiz
   static var wallet_certificate_validity: String { return UBLocalized.tr(Key.wallet_certificate_validity) }
  /// Prüfung erfolgreich
   static var wallet_certificate_verify_success: String { return UBLocalized.tr(Key.wallet_certificate_verify_success) }
  /// Das Zertifikat wird geprüft
   static var wallet_certificate_verifying: String { return UBLocalized.tr(Key.wallet_certificate_verifying) }
  /// Kein Zutritt.
   static var wallet_check_mode_info_2g_not_ok_text: String { return UBLocalized.tr(Key.wallet_check_mode_info_2g_not_ok_text) }
  /// Zutritt zu Betrieben und Veranstaltungen für geimpfte oder genesene Personen.
   static var wallet_check_mode_info_2g_ok_text: String { return UBLocalized.tr(Key.wallet_check_mode_info_2g_ok_text) }
  /// Für den Zutritt zu Betrieben und Veranstaltungen wird zusätzlich zum Covid-Zertifikat für geimpfte oder genesene Personen ein negatives Testresultat benötigt.
   static var wallet_check_mode_info_2g_plus_not_ok_text: String { return UBLocalized.tr(Key.wallet_check_mode_info_2g_plus_not_ok_text) }
  /// Zutritt zu Betrieben und Veranstaltungen für Personen, deren vollständige Impfung, Auffrischimpfung oder Genesung (basierend auf PCR-Test) nicht länger als 120 Tage zurückliegt. Sie benötigen kein zusätzliches Testzertifikat.
   static var wallet_check_mode_info_2g_plus_ok_text: String { return UBLocalized.tr(Key.wallet_check_mode_info_2g_plus_ok_text) }
  /// Kein Zutritt.
   static var wallet_check_mode_info_3g_not_ok_text: String { return UBLocalized.tr(Key.wallet_check_mode_info_3g_not_ok_text) }
  /// Zutritt zu Betrieben und Veranstaltungen für geimpfte, genesene oder negativ getestete Personen.
   static var wallet_check_mode_info_3g_ok_text: String { return UBLocalized.tr(Key.wallet_check_mode_info_3g_ok_text) }
  /// Info
   static var wallet_check_mode_info_title: String { return UBLocalized.tr(Key.wallet_check_mode_info_title) }
  /// Versuchen Sie es später erneut.
   static var wallet_detail_network_error_text: String { return UBLocalized.tr(Key.wallet_detail_network_error_text) }
  /// Prüfung zur Zeit nicht möglich
   static var wallet_detail_network_error_title: String { return UBLocalized.tr(Key.wallet_detail_network_error_title) }
  /// Prüfung offline nicht möglich
   static var wallet_detail_offline_retry_title: String { return UBLocalized.tr(Key.wallet_detail_offline_retry_title) }
  /// Mehr erfahren
   static var wallet_eol_banner_invalid_from_first_february_detail_more_info: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_detail_more_info) }
  /// Dieses Zertifikat wird bald ablaufen.
   static var wallet_eol_banner_invalid_from_first_february_detail_text: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_detail_text) }
  /// Verkürzte Gültigkeitsdauer
   static var wallet_eol_banner_invalid_from_first_february_detail_title: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_detail_title) }
  /// Verkürzte Gültigkeitsdauer
   static var wallet_eol_banner_invalid_from_first_february_homescreen_title: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_homescreen_title) }
  /// Dieses Covid-Zertifikat kann ab dem 31. Jan. 2022 nicht mehr verwendet werden, da die Gültigkeitsdauer dann bereits abgelaufen sein wird.
   static var wallet_eol_banner_invalid_from_first_february_popup_bold_text: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_popup_bold_text) }
  /// Mehr erfahren
   static var wallet_eol_banner_invalid_from_first_february_popup_link_text: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_popup_link_text) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/warum-wird-die-gueltigkeitsdauer-der-zertifikate-fuer-eine-impfung-oder-eine
   static var wallet_eol_banner_invalid_from_first_february_popup_link_url: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_popup_link_url) }
  /// Per 31. Jan. 2022 gelten in der Schweiz reduzierte Gültigkeitsdauern von 270 statt 365 Tagen für Covid-Zertifikate für Geimpfte oder Genesene. Dieses Zertifikat ist von der verkürzten Gültigkeitsdauer unmittelbar betroffen:
   static var wallet_eol_banner_invalid_from_first_february_popup_text1: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_popup_text1) }
  /// Info
   static var wallet_eol_banner_invalid_from_first_february_popup_title: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_from_first_february_popup_title) }
  /// Mehr erfahren?
   static var wallet_eol_banner_invalid_in_three_weeks_detail_more_info: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_detail_more_info) }
  /// Dieses Zertifikat läuft bald ab.
   static var wallet_eol_banner_invalid_in_three_weeks_detail_text: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_detail_text) }
  /// Info
   static var wallet_eol_banner_invalid_in_three_weeks_detail_title: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_detail_title) }
  /// Bald abgelaufen
   static var wallet_eol_banner_invalid_in_three_weeks_homescreen_title: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_homescreen_title) }
  /// Dieses Covid-Zertifikat ist nur noch wenige Tage gültig. Bitte beachten Sie das auf dem Zertifikat ausgewiesene Ablaufdatum.
   static var wallet_eol_banner_invalid_in_three_weeks_popup_bold_text: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_popup_bold_text) }
  /// Und nun?
   static var wallet_eol_banner_invalid_in_three_weeks_popup_link_text: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_popup_link_text) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/haeufig-gestellte-fragen.html?faq-url=/covid/de/covid-zertifikat/was-soll-ich-tun-wenn-mein-covid-zertifikat-nach-schweizer-gueltigkeitsregeln-bald
   static var wallet_eol_banner_invalid_in_three_weeks_popup_link_url: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_popup_link_url) }
  /// 
   static var wallet_eol_banner_invalid_in_three_weeks_popup_text1: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_popup_text1) }
  /// 
   static var wallet_eol_banner_invalid_in_three_weeks_popup_text2: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_popup_text2) }
  /// Info
   static var wallet_eol_banner_invalid_in_three_weeks_popup_title: String { return UBLocalized.tr(Key.wallet_eol_banner_invalid_in_three_weeks_popup_title) }
  /// Gültigkeitsdauer für die Schweiz überschritten
   static var wallet_error_expired: String { return UBLocalized.tr(Key.wallet_error_expired) }
  /// Format des Zertifikat\nungültig
   static var wallet_error_invalid_format: String { return UBLocalized.tr(Key.wallet_error_invalid_format) }
  /// ungültig
   static var wallet_error_invalid_format_bold: String { return UBLocalized.tr(Key.wallet_error_invalid_format_bold) }
  /// Zertifikat mit\nungültiger Signatur
   static var wallet_error_invalid_signature: String { return UBLocalized.tr(Key.wallet_error_invalid_signature) }
  /// ungültiger Signatur
   static var wallet_error_invalid_signature_bold: String { return UBLocalized.tr(Key.wallet_error_invalid_signature_bold) }
  /// Entspricht nicht den Gültigkeitskriterien der Schweiz
   static var wallet_error_national_rules: String { return UBLocalized.tr(Key.wallet_error_national_rules) }
  /// Das technische Ablaufdatum für diesen QR-Code ist erreicht.
   static var wallet_error_qr_code_expired: String { return UBLocalized.tr(Key.wallet_error_qr_code_expired) }
  /// Zertifikat wurde\nwiderrufen
   static var wallet_error_revocation: String { return UBLocalized.tr(Key.wallet_error_revocation) }
  /// widerrufen
   static var wallet_error_revocation_bold: String { return UBLocalized.tr(Key.wallet_error_revocation_bold) }
  /// In der Schweiz gültig ab:\n{DATE}
   static var wallet_error_valid_from: String { return UBLocalized.tr(Key.wallet_error_valid_from) }
  /// Häufige Fragen
   static var wallet_faq_header: String { return UBLocalized.tr(Key.wallet_faq_header) }
  /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
   static var wallet_faq_questions_answer_1: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_1) }
  /// Von Covid-19 genesene Personen können das Covid-Zertifikat über ein Online-Formular auf der Webseite des Kantons beantragen. Das Covid-Zertifikat wird anschliessend per Post zugeschickt.
   static var wallet_faq_questions_answer_1_1: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_1_1) }
  /// Sie können Ihr Covid-Zertifikat in Papierform vorweisen oder Sie benutzen die COVID Certificate App, um Zertifikate in der App zu speichern und direkt aus der App vorzuweisen. Ob Sie Ihr Zertifikat auf Papier oder in der App vorweisen, ist Ihnen überlassen. \n\nBeachten Sie, dass Sie in jedem Fall auf Verlangen auch noch ein Ausweisdokument vorweisen müssen.
   static var wallet_faq_questions_answer_2: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_2) }
  /// Die Gültigkeitsdauer unterscheidet sich je nachdem, ob Sie eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis haben. Aufgrund neuer wissenschaftlicher Erkenntnisse kann sich die Gültigkeitsdauer verändern. Die aktuell geltende Gültigkeitsdauer von Covid-Zertifikaten finden Sie hier:
   static var wallet_faq_questions_answer_2_1: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_2_1) }
  /// Ihre Daten werden nicht in einem zentralen System gespeichert, sondern nur lokal auf Ihrem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
   static var wallet_faq_questions_answer_3: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_3) }
  /// Der QR-Code auf dem Covid-Zertifikat enthält eine elektronische Signatur. Die Signatur ist ein wichtiges Sicherheitsmerkmal und macht das Covid-Zertifikat fälschungssicher. Das Covid-Zertifikat ist zudem nur in Kombination mit einem Ausweisdokument gültig.
   static var wallet_faq_questions_answer_4: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_4) }
  /// Ihr Covid-Zertifikat wird in keinem zentralen System gespeichert. Es befindet sich ausschliesslich in Ihrem Besitz. Bewahren Sie das Covid-Zertifikat auf Papier und/oder als PDF deshalb sorgfältig auf. Bei Verlust und Bedarf nach einem Ersatz kann eine Gebühr erhoben werden.
   static var wallet_faq_questions_answer_5: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_5) }
  /// Die «COVID Certificate»-App bietet Inhaberinnen und Inhabern von Covid-Zertifikaten die Möglichkeit, eine datenminimierte Zertifikatskopie zu generieren. Dieses «Zertifikat Light» zeigt lediglich das Vorliegen eines gültigen Covid-Zertifikats an, jedoch ohne Gesundheitsdaten zu enthalten. \n\nDie datenminimierte Alternative zum Covid-Zertifikat wurde auf Wunsch des Eidgenössischen Datenschutz- und Öffentlichkeitsbeauftragten (EDÖB) entwickelt, da Dritte mit selbstentwickelten Apps bei der Prüfung von Covid-Zertifikaten Gesundheitsdaten wie beispielsweise Impfstoff oder Datum der Impfung einsehen könnten. Mittels dem «Zertifikat Light» wird dies verhindert.\n\nDas «Zertifikat Light» ist lediglich elektronisch innerhalb der App verfügbar und wird nur in der Schweiz anerkannt. Aus Datenschutzgründen hat das «Zertifikat Light» eine maximale Gültigkeitsdauer von {LIGHT_CERT_VALIDITY_IN_H} Stunden und muss danach erneut aktiviert werden. Wird das normale Zertifikat vor Ablauf der {LIGHT_CERT_VALIDITY_IN_H} Stunden benötigt, kann das Zertifikat Light einfach deaktiviert werden.
   static var wallet_faq_questions_answer_6: String { return UBLocalized.tr(Key.wallet_faq_questions_answer_6) }
  /// Weitere Informationen
   static var wallet_faq_questions_linktext_2_1: String { return UBLocalized.tr(Key.wallet_faq_questions_linktext_2_1) }
  /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/#contents2
   static var wallet_faq_questions_linkurl_2_1: String { return UBLocalized.tr(Key.wallet_faq_questions_linkurl_2_1) }
  /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
   static var wallet_faq_questions_question_1: String { return UBLocalized.tr(Key.wallet_faq_questions_question_1) }
  /// Wie erhalte ich nach einer durchgemachten Covid-19-Erkrankung ein Covid-Zertifikat?
   static var wallet_faq_questions_question_1_1: String { return UBLocalized.tr(Key.wallet_faq_questions_question_1_1) }
  /// Wie kann ich ein Covid-Zertifikat vorweisen?
   static var wallet_faq_questions_question_2: String { return UBLocalized.tr(Key.wallet_faq_questions_question_2) }
  /// Wie lange ist das Covid-Zertifikat gültig?
   static var wallet_faq_questions_question_2_1: String { return UBLocalized.tr(Key.wallet_faq_questions_question_2_1) }
  /// Wo sind meine Daten gespeichert?
   static var wallet_faq_questions_question_3: String { return UBLocalized.tr(Key.wallet_faq_questions_question_3) }
  /// Wie werden Missbrauch und Fälschung verhindert?
   static var wallet_faq_questions_question_4: String { return UBLocalized.tr(Key.wallet_faq_questions_question_4) }
  /// Was passiert, wenn ich mein Covid-Zertifikat verliere?
   static var wallet_faq_questions_question_5: String { return UBLocalized.tr(Key.wallet_faq_questions_question_5) }
  /// Was ist das Zertifikat Light?
   static var wallet_faq_questions_question_6: String { return UBLocalized.tr(Key.wallet_faq_questions_question_6) }
  /// Das Covid-Zertifikat bietet die Möglichkeit, eine Covid-19-Impfung, eine durchgemachte Erkrankung oder ein negatives Testergebnis fälschungssicher zu dokumentieren.
   static var wallet_faq_questions_subtitle: String { return UBLocalized.tr(Key.wallet_faq_questions_subtitle) }
  /// Was sind Covid-Zertifikate?
   static var wallet_faq_questions_title: String { return UBLocalized.tr(Key.wallet_faq_questions_title) }
  /// Um ein Covid-Zertifikat zur App hinzuzufügen, benötigen Sie das Ihnen ausgestellte Originalzertifikat auf Papier oder als PDF-Dokument. Den darauf abgebildeten QR-Code können Sie mit der COVID Certificate App scannen und hinzufügen. Anschliessend erscheint das Covid-Zertifikat direkt in der App.
   static var wallet_faq_works_answer_1: String { return UBLocalized.tr(Key.wallet_faq_works_answer_1) }
  /// Ja das ist möglich. So können Sie z. B. alle Covid-Zertifikate von Familienangehörigen in Ihrer App speichern. Auch in diesem Fall gilt: Das Covid-Zertifikat ist nur in Kombination mit einem Ausweisdokument des Zertifikatsinhabers / der Zertifikatsinhaberin gültig.
   static var wallet_faq_works_answer_2: String { return UBLocalized.tr(Key.wallet_faq_works_answer_2) }
  /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
   static var wallet_faq_works_answer_2_1: String { return UBLocalized.tr(Key.wallet_faq_works_answer_2_1) }
  /// Die App prüft automatisch, ob Ihr Zertifikat den Gültigkeitskriterien der Schweiz entspricht. Sollte Ihr Covid-Zertifikat abgelaufen oder technisch ungültig sein, wird Ihnen dies direkt auf dem Zertifikat in der App angezeigt.
   static var wallet_faq_works_answer_3: String { return UBLocalized.tr(Key.wallet_faq_works_answer_3) }
  /// Sie können die App ohne eine Internetverbindung verwenden. Auch im Offline-Modus können Zertifikate vorgewiesen und von den Prüfern gescannt und verifiziert werden.\n\nUm in der «COVID Certificate»-App anzeigen zu können, ob ihr Zertifikat den Gültigkeitskriterien der Schweiz entspricht und bis wann Ihr Zertifikat gültig ist, muss die App jedoch regelmässig online sein.
   static var wallet_faq_works_answer_3_1: String { return UBLocalized.tr(Key.wallet_faq_works_answer_3_1) }
  /// Ihre persönlichen Daten werden in keinem zentralen System gespeichert, sondern befinden sich ausschliesslich bei Ihnen lokal auf dem Mobilgerät, respektive im QR-Code auf dem Covid-Zertifikat in Papierform.
   static var wallet_faq_works_answer_4: String { return UBLocalized.tr(Key.wallet_faq_works_answer_4) }
  /// Der QR-Code enthält alle Informationen, die Sie auf Ihrem Covid-Zertifikat in Papierform im Klartext finden. Weiter befindet sich im QR-Code eine elektronische Signatur, mit der sich die Echtheit des Covid-Zertifikats überprüfen lässt. Dadurch wird das Covid-Zertifikat fälschungssicher.
   static var wallet_faq_works_answer_5: String { return UBLocalized.tr(Key.wallet_faq_works_answer_5) }
  /// In der «COVID Certificate»-App finden Sie in der Detailansicht des elektronischen Covid-Zertifikats die Funktion «Exportieren». Damit können Sie ein PDF erstellen, dieses speichern und ausdrucken.
   static var wallet_faq_works_answer_5_1: String { return UBLocalized.tr(Key.wallet_faq_works_answer_5_1) }
  /// Sie können Ihr Covid-Zertifikat einfach wieder auf Ihrem Mobilgerät speichern. Laden Sie dazu die App erneut herunter und scannen Sie anschliessend den QR-Code auf Ihrem Covid-Zertifikat auf Papier oder als PDF.
   static var wallet_faq_works_answer_6: String { return UBLocalized.tr(Key.wallet_faq_works_answer_6) }
  /// Wie kann ich ein Covid-Zertifikat zur App hinzufügen?
   static var wallet_faq_works_question_1: String { return UBLocalized.tr(Key.wallet_faq_works_question_1) }
  /// Können auch mehrere Covid-Zertifikate hinzugefügt werden?
   static var wallet_faq_works_question_2: String { return UBLocalized.tr(Key.wallet_faq_works_question_2) }
  /// Was ist ein Transfer-Code?
   static var wallet_faq_works_question_2_1: String { return UBLocalized.tr(Key.wallet_faq_works_question_2_1) }
  /// Wie sehe ich, ob mein Covid-Zertifikat gültig ist?
   static var wallet_faq_works_question_3: String { return UBLocalized.tr(Key.wallet_faq_works_question_3) }
  /// Kann ich die App auch offline verwenden?
   static var wallet_faq_works_question_3_1: String { return UBLocalized.tr(Key.wallet_faq_works_question_3_1) }
  /// Wie sind meine Daten geschützt?
   static var wallet_faq_works_question_4: String { return UBLocalized.tr(Key.wallet_faq_works_question_4) }
  /// Welche Daten sind im QR-Code enthalten?
   static var wallet_faq_works_question_5: String { return UBLocalized.tr(Key.wallet_faq_works_question_5) }
  /// Ich habe das Covid-Zertifikat ausschliesslich elektronisch in der App. Wie komme ich zum Zertifikat als PDF oder auf Papier?
   static var wallet_faq_works_question_5_1: String { return UBLocalized.tr(Key.wallet_faq_works_question_5_1) }
  /// Was muss ich tun, wenn ich das Covid-Zertifikat oder die App lösche?
   static var wallet_faq_works_question_6: String { return UBLocalized.tr(Key.wallet_faq_works_question_6) }
  /// Mit der COVID Certificate App können Sie Covid-Zertifikate einfach und sicher auf Ihrem Mobilgerät abspeichern und vorweisen.
   static var wallet_faq_works_subtitle: String { return UBLocalized.tr(Key.wallet_faq_works_subtitle) }
  /// Wie funktioniert \ndie App?
   static var wallet_faq_works_title: String { return UBLocalized.tr(Key.wallet_faq_works_title) }
  /// Gültigkeit im Ausland
   static var wallet_foreign_rules_check_button: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_button) }
  /// Wählen
   static var wallet_foreign_rules_check_country_empty_label: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_country_empty_label) }
  /// Land:
   static var wallet_foreign_rules_check_country_label: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_country_label) }
  /// Land auswählen
   static var wallet_foreign_rules_check_country_picker_title: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_country_picker_title) }
  /// Die angegebene Uhrzeit liegt in der Vergangenheit
   static var wallet_foreign_rules_check_date_in_past_error: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_date_in_past_error) }
  /// Einreise am:
   static var wallet_foreign_rules_check_date_label: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_date_label) }
  /// Fehler beim Laden der verfügbaren Länder
   static var wallet_foreign_rules_check_error_title: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_error_title) }
  /// Prüfen für:
   static var wallet_foreign_rules_check_form_title: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_form_title) }
  /// Für die Aktualität und Vollständigkeit der gegebenen Informationen übernimmt der Bund keine Haftung.
   static var wallet_foreign_rules_check_hint_1: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hint_1) }
  /// Die Einreiseregeln können sich ändern. Prüfen Sie daher die Gültigkeit kurz vor der Abreise und informieren Sie sich zusätzlich online über die aktuellen Einreiseregeln des Ziellandes.
   static var wallet_foreign_rules_check_hint_2: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hint_2) }
  /// Die oben genannten Angaben beziehen sich nur auf die Einreiseregeln des Ziellandes. Für allfällige zertifikatspflichtige Bereiche innerhalb des Landes können andere Regeln gelten.
   static var wallet_foreign_rules_check_hint_3: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hint_3) }
  /// Land nicht gefunden? Nicht alle Länder akzeptieren Covid-Zertifikate oder es wurden keine Einreiseregeln verfügbar gemacht.
   static var wallet_foreign_rules_check_hint_4: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hint_4) }
  /// Mehr Informationen finden Sie unter
   static var wallet_foreign_rules_check_hints_more_info_label: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hints_more_info_label) }
  /// reopen.europa.eu
   static var wallet_foreign_rules_check_hints_more_info_link_text: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hints_more_info_link_text) }
  /// https://reopen.europa.eu/
   static var wallet_foreign_rules_check_hints_more_info_link_url: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hints_more_info_link_url) }
  /// Hinweise
   static var wallet_foreign_rules_check_hints_title: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_hints_title) }
  /// Um die Gültigkeit zu überprüfen, muss Ihr Smartphone mit dem Internet verbunden sein.
   static var wallet_foreign_rules_check_network_error_text: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_network_error_text) }
  /// {COUNTRY}, {DATE}
   static var wallet_foreign_rules_check_state_country_and_date: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_state_country_and_date) }
  /// Bitte wählen Sie ein Land und den Einreisezeitpunkt aus.
   static var wallet_foreign_rules_check_state_empty: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_state_empty) }
  /// Ungültig für die Einreise nach:
   static var wallet_foreign_rules_check_state_invalid: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_state_invalid) }
  /// Gültig für die Einreise nach:
   static var wallet_foreign_rules_check_state_valid: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_state_valid) }
  /// Finden Sie vor einer Auslandreise heraus, ob Ihr Covid-Zertifikat zum Zeitpunkt der Einreise ins Zielland gültig ist.
   static var wallet_foreign_rules_check_subtitle: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_subtitle) }
  /// Gültigkeit für Reisen ins Ausland
   static var wallet_foreign_rules_check_title: String { return UBLocalized.tr(Key.wallet_foreign_rules_check_title) }
  /// Sie haben ein Covid-Zertifikat auf Papier oder als PDF und möchten es zur App hinzufügen.
   static var wallet_homescreen_add_certificate_description: String { return UBLocalized.tr(Key.wallet_homescreen_add_certificate_description) }
  /// Zertifikat hinzufügen
   static var wallet_homescreen_add_title: String { return UBLocalized.tr(Key.wallet_homescreen_add_title) }
  /// Transfer-Code erstellen
   static var wallet_homescreen_add_transfer_code: String { return UBLocalized.tr(Key.wallet_homescreen_add_transfer_code) }
  /// Scannen Sie den QR-Code auf dem Covid-Zertifikat, um es zur App hinzuzufügen.
   static var wallet_homescreen_explanation: String { return UBLocalized.tr(Key.wallet_homescreen_explanation) }
  /// Gültigkeit konnte nicht ermittelt werden
   static var wallet_homescreen_network_error: String { return UBLocalized.tr(Key.wallet_homescreen_network_error) }
  /// Offline Modus
   static var wallet_homescreen_offline: String { return UBLocalized.tr(Key.wallet_homescreen_offline) }
  /// PDF importieren
   static var wallet_homescreen_pdf_import: String { return UBLocalized.tr(Key.wallet_homescreen_pdf_import) }
  /// QR-Code scannen
   static var wallet_homescreen_qr_code_scannen: String { return UBLocalized.tr(Key.wallet_homescreen_qr_code_scannen) }
  /// Nächsten Schritt wählen
   static var wallet_homescreen_what_to_do: String { return UBLocalized.tr(Key.wallet_homescreen_what_to_do) }
  /// Zur Check-App
   static var wallet_info_box_certificate_scan_button_check_app: String { return UBLocalized.tr(Key.wallet_info_box_certificate_scan_button_check_app) }
  /// Verstanden
   static var wallet_info_box_certificate_scan_close: String { return UBLocalized.tr(Key.wallet_info_box_certificate_scan_close) }
  /// Für eine Datenschutzkonforme und schnellere Prüfung nutzen Sie die "COVID Certificate Check"-App.
   static var wallet_info_box_certificate_scan_text: String { return UBLocalized.tr(Key.wallet_info_box_certificate_scan_text) }
  /// «COVID Certificate Check»-App.
   static var wallet_info_box_certificate_scan_text_bold: String { return UBLocalized.tr(Key.wallet_info_box_certificate_scan_text_bold) }
  /// Wollen Sie Zertifikate überprüfen?
   static var wallet_info_box_certificate_scan_title: String { return UBLocalized.tr(Key.wallet_info_box_certificate_scan_title) }
  /// Aktivieren
   static var wallet_notification_disabled_button: String { return UBLocalized.tr(Key.wallet_notification_disabled_button) }
  /// Tipp: Mitteilungen aktivieren
   static var wallet_notification_disabled_titel: String { return UBLocalized.tr(Key.wallet_notification_disabled_titel) }
  /// Weiter
   static var wallet_notification_permission_button: String { return UBLocalized.tr(Key.wallet_notification_permission_button) }
  /// Die App kann Sie informieren, sobald das Zertifikat eingetroffen ist.  Erlauben Sie dazu der App, Ihnen Mitteilungen zu senden.
   static var wallet_notification_permission_text: String { return UBLocalized.tr(Key.wallet_notification_permission_text) }
  /// Mitteilungen erlauben
   static var wallet_notification_permission_title: String { return UBLocalized.tr(Key.wallet_notification_permission_title) }
  /// Das Covid-Zertifikat ist eingetroffen
   static var wallet_notification_transfer_text: String { return UBLocalized.tr(Key.wallet_notification_transfer_text) }
  /// Transfer erfolgreich
   static var wallet_notification_transfer_title: String { return UBLocalized.tr(Key.wallet_notification_transfer_title) }
  /// Um die aktuelle Gültigkeit anzeigen zu können, muss die App regelmässig online sein.
   static var wallet_offline_description: String { return UBLocalized.tr(Key.wallet_offline_description) }
  /// Akzeptieren
   static var wallet_onboarding_accept_button: String { return UBLocalized.tr(Key.wallet_onboarding_accept_button) }
  /// Die App
   static var wallet_onboarding_app_header: String { return UBLocalized.tr(Key.wallet_onboarding_app_header) }
  /// Mit der App können Sie Covid-Zertifikate sicher auf dem Smartphone aufbewahren und einfach vorweisen.
   static var wallet_onboarding_app_text: String { return UBLocalized.tr(Key.wallet_onboarding_app_text) }
  /// COVID Certificate
   static var wallet_onboarding_app_title: String { return UBLocalized.tr(Key.wallet_onboarding_app_title) }
  /// Datenschutzerklärung &\nNutzungsbedingungen
   static var wallet_onboarding_external_privacy_button: String { return UBLocalized.tr(Key.wallet_onboarding_external_privacy_button) }
  /// Nutzungsbedingungen
   static var wallet_onboarding_privacy_conditionsofuse_title: String { return UBLocalized.tr(Key.wallet_onboarding_privacy_conditionsofuse_title) }
  /// Datenschutz
   static var wallet_onboarding_privacy_header: String { return UBLocalized.tr(Key.wallet_onboarding_privacy_header) }
  /// Datenschutzerklärung
   static var wallet_onboarding_privacy_privacypolicy_title: String { return UBLocalized.tr(Key.wallet_onboarding_privacy_privacypolicy_title) }
  /// Die Zertifikate sind nur lokal auf Ihrem Smartphone hinterlegt. Die Daten werden nicht in einem zentralen System gespeichert.
   static var wallet_onboarding_privacy_text: String { return UBLocalized.tr(Key.wallet_onboarding_privacy_text) }
  /// Ihre Daten bleiben \nin der App
   static var wallet_onboarding_privacy_title: String { return UBLocalized.tr(Key.wallet_onboarding_privacy_title) }
  /// Vorteile
   static var wallet_onboarding_show_header: String { return UBLocalized.tr(Key.wallet_onboarding_show_header) }
  /// Die auf dem Covid-Zertifikat dargestellten Daten sind auch im QR-Code enthalten.
   static var wallet_onboarding_show_text1: String { return UBLocalized.tr(Key.wallet_onboarding_show_text1) }
  /// Beim Vorweisen wird der QR-Code mit einer Prüf-App gescannt. Die enthaltenen Daten werden dabei automatisch auf Echtheit und Gültigkeit überprüft.
   static var wallet_onboarding_show_text2: String { return UBLocalized.tr(Key.wallet_onboarding_show_text2) }
  /// Zertifikate einfach vorweisen
   static var wallet_onboarding_show_title: String { return UBLocalized.tr(Key.wallet_onboarding_show_title) }
  /// Vorteile
   static var wallet_onboarding_store_header: String { return UBLocalized.tr(Key.wallet_onboarding_store_header) }
  /// Covid-Zertifikate können einfach zur App hinzugefügt und digital aufbewahrt werden.
   static var wallet_onboarding_store_text1: String { return UBLocalized.tr(Key.wallet_onboarding_store_text1) }
  /// Die App prüft die Zertifikate auf ihre Gültigkeit in der Schweiz. So können Sie sich versichern, dass Ihre Zertifikate gültig sind.
   static var wallet_onboarding_store_text2: String { return UBLocalized.tr(Key.wallet_onboarding_store_text2) }
  /// Covid-Zertifikate digital aufbewahren
   static var wallet_onboarding_store_title: String { return UBLocalized.tr(Key.wallet_onboarding_store_title) }
  /// Ausserhalb der Schweiz nicht gültig
   static var wallet_only_valid_in_switzerland: String { return UBLocalized.tr(Key.wallet_only_valid_in_switzerland) }
  /// https://covidcertificate-form.admin.ch/immunityrequest
   static var wallet_rat_recovery_conversion_url: String { return UBLocalized.tr(Key.wallet_rat_recovery_conversion_url) }
  /// Für Prüfende
   static var wallet_refresh_button_info_fat_title_3: String { return UBLocalized.tr(Key.wallet_refresh_button_info_fat_title_3) }
  /// Mehr erfahren
   static var wallet_refresh_button_info_link_text: String { return UBLocalized.tr(Key.wallet_refresh_button_info_link_text) }
  /// https://www.bag.admin.ch/bag/de/home/krankheiten/ausbrueche-epidemien-pandemien/aktuelle-ausbrueche-epidemien/novel-cov/covid-zertifikat/covid-zertifikat-pruefer-aussteller-technische-informationen.html#1070048217
   static var wallet_refresh_button_info_link_url: String { return UBLocalized.tr(Key.wallet_refresh_button_info_link_url) }
  /// Der «Refresh-Button» wurde entfernt.
   static var wallet_refresh_button_info_text_1: String { return UBLocalized.tr(Key.wallet_refresh_button_info_text_1) }
  /// Sollte Ihr Covid-Zertifikat abgelaufen oder technisch ungültig sein, wird Ihnen dies direkt auf dem Zertifikat angezeigt.
   static var wallet_refresh_button_info_text_2: String { return UBLocalized.tr(Key.wallet_refresh_button_info_text_2) }
  /// Die Prüfung von Covid-Zertifikaten ist mit der App «COVID Certificate Check» vorzunehmen.
   static var wallet_refresh_button_info_text_3: String { return UBLocalized.tr(Key.wallet_refresh_button_info_text_3) }
  /// Info
   static var wallet_refresh_button_info_title: String { return UBLocalized.tr(Key.wallet_refresh_button_info_title) }
  /// Erneut scannen
   static var wallet_scan_again: String { return UBLocalized.tr(Key.wallet_scan_again) }
  /// Scannen Sie den QR-Code auf dem Covid-Zertifikat.
   static var wallet_scanner_explanation: String { return UBLocalized.tr(Key.wallet_scanner_explanation) }
  /// Erstens
   static var wallet_scanner_how_it_works_accessibility_icon1: String { return UBLocalized.tr(Key.wallet_scanner_how_it_works_accessibility_icon1) }
  /// Zweitens
   static var wallet_scanner_how_it_works_accessibility_icon2: String { return UBLocalized.tr(Key.wallet_scanner_how_it_works_accessibility_icon2) }
  /// Drittens
   static var wallet_scanner_how_it_works_accessibility_icon3: String { return UBLocalized.tr(Key.wallet_scanner_how_it_works_accessibility_icon3) }
  /// Ein Covid-Zertifikat können Sie nach einer vollständigen Covid-19-Impfung, nach einer durchgemachten Erkrankung oder nach einem negativen Testergebnis erhalten. Das Zertifikat stellt Ihnen in der Regel das Gesundheitsfachpersonal vor Ort auf Anfrage aus.
   static var wallet_scanner_howitworks_answer1: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_answer1) }
  /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
   static var wallet_scanner_howitworks_external_link: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_external_link) }
  /// Weitere Informationen
   static var wallet_scanner_howitworks_external_link_title: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_external_link_title) }
  /// So funktioniert's
   static var wallet_scanner_howitworks_header: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_header) }
  /// Wann und wo kann ich ein Covid-Zertifikat erhalten?
   static var wallet_scanner_howitworks_question1: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_question1) }
  /// Um ein Covid-Zertifikat zur App hinzufügen zu können, benötigen Sie das Originalzertifikat auf Papier oder als PDF.
   static var wallet_scanner_howitworks_text1: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_text1) }
  /// Tippen Sie in der App auf «Hinzufügen», um ein neues Zertifikat zur App hinzuzufügen.
   static var wallet_scanner_howitworks_text2: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_text2) }
  /// Halten Sie nun die Kamera des Smartphones über den QR-Code auf dem Originalzertifikat, um den Code einzuscannen.
   static var wallet_scanner_howitworks_text3: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_text3) }
  /// Es erscheint eine Vorschau des Covid-Zertifikats. Tippen Sie auf «Hinzufügen» um das Zertifikat sicher in der App zu speichern.
   static var wallet_scanner_howitworks_text4: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_text4) }
  /// Covid-Zertifikate\nhinzufügen
   static var wallet_scanner_howitworks_title: String { return UBLocalized.tr(Key.wallet_scanner_howitworks_title) }
  /// So funktioniert's
   static var wallet_scanner_info_button: String { return UBLocalized.tr(Key.wallet_scanner_info_button) }
  /// Hinzufügen
   static var wallet_scanner_title: String { return UBLocalized.tr(Key.wallet_scanner_title) }
  /// https://www.bit.admin.ch/bit/de/home/dokumentation/covid-certificate-app.html
   static var wallet_terms_privacy_link: String { return UBLocalized.tr(Key.wallet_terms_privacy_link) }
  /// Datum, Uhrzeit oder Zeitzone auf dem Gerät sind falsch eingestellt.
   static var wallet_time_inconsistency_error_text: String { return UBLocalized.tr(Key.wallet_time_inconsistency_error_text) }
  /// Prüfung nicht möglich
   static var wallet_time_inconsistency_error_title: String { return UBLocalized.tr(Key.wallet_time_inconsistency_error_title) }
  /// Transfer
   static var wallet_transfer_code_card_title: String { return UBLocalized.tr(Key.wallet_transfer_code_card_title) }
  /// Ihr Transfer-Code wurde erstellt
   static var wallet_transfer_code_code_created_title: String { return UBLocalized.tr(Key.wallet_transfer_code_code_created_title) }
  /// Transfer Code kopiert
   static var wallet_transfer_code_copied: String { return UBLocalized.tr(Key.wallet_transfer_code_copied) }
  /// Code erstellen
   static var wallet_transfer_code_create_code_button: String { return UBLocalized.tr(Key.wallet_transfer_code_create_code_button) }
  /// Erstellt am {DATE}
   static var wallet_transfer_code_createdat: String { return UBLocalized.tr(Key.wallet_transfer_code_createdat) }
  /// Fertig
   static var wallet_transfer_code_done_button: String { return UBLocalized.tr(Key.wallet_transfer_code_done_button) }
  /// Transfer-Code konnte nicht erstellt werden
   static var wallet_transfer_code_error_title: String { return UBLocalized.tr(Key.wallet_transfer_code_error_title) }
  /// Noch {DAYS} Tage gültig
   static var wallet_transfer_code_expire_plural: String { return UBLocalized.tr(Key.wallet_transfer_code_expire_plural) }
  /// {DAYS} Tage
   static var wallet_transfer_code_expire_plural_bold: String { return UBLocalized.tr(Key.wallet_transfer_code_expire_plural_bold) }
  /// Noch 1 Tag gültig
   static var wallet_transfer_code_expire_singular: String { return UBLocalized.tr(Key.wallet_transfer_code_expire_singular) }
  /// 1 Tag
   static var wallet_transfer_code_expire_singular_bold: String { return UBLocalized.tr(Key.wallet_transfer_code_expire_singular_bold) }
  /// Wenn Sie einen Covid-Test machen (PCR-Test oder Antigen-Schnelltest), kann der Transfer-Code zur schnellen Übermittlung von Covid-Zertifikaten zum Einsatz kommen.\n\nInformieren Sie sich bei Ihrem Testcenter, in der Apotheke oder bei Ihrem Arzt, ob die Übermittlung per Transfer-Code angeboten wird.
   static var wallet_transfer_code_faq_questions_answer_1: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_answer_1) }
  /// Aktuell ist die Übermittlung per Transfer-Code auf Covid-Tests ausgelegt. Wie Sie ein Covid-Zertifikat nach einer Impfung erhalten erfahren Sie hier:
   static var wallet_transfer_code_faq_questions_answer_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_answer_2) }
  /// Falls die Stelle, die den Covid-Test durchführt, die Übermittlung per Transfer-Code anbietet, werden Sie bereits bei der Anmeldung oder der Testentnahme nach einem Transfer-Code gefragt.\n\nDen Transfer-Code können Sie in der «COVID Certificate»-App erstellen. Tippen Sie dazu auf dem Startbildschirm auf «Hinzufügen» resp. auf das «Plus»-Symbol unten rechts. Danach tippen Sie auf «Transfer-Code erstellen».\n\nDie App zeigt Ihnen einen 9-stelligen Code an. Diesen können Sie entweder bei der Anmeldung in ein Formular eintragen oder direkt bei der Testentnahme angeben.
   static var wallet_transfer_code_faq_questions_answer_3: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_answer_3) }
  /// Nein, ein Transfer-Code kann nur einmal verwendet werden. Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie bitte für jedes Zertifikat einen neuen Code.
   static var wallet_transfer_code_faq_questions_answer_4: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_answer_4) }
  /// Weitere Informationen
   static var wallet_transfer_code_faq_questions_linktext_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_linktext_2) }
  /// https://bag-coronavirus.ch/zertifikat/wie-erhalte-ich-ein-covid-zertifikat-und-wie-verwende-ich-es/
   static var wallet_transfer_code_faq_questions_linkurl_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_linkurl_2) }
  /// Wer bietet die Übermittlung per Transfer-Code an?
   static var wallet_transfer_code_faq_questions_question_1: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_question_1) }
  /// Können Transfer-Codes auch zur Übermittlung von Impfzertifikaten verwendet werden?
   static var wallet_transfer_code_faq_questions_question_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_question_2) }
  /// Wie funktioniert die Übermittlung per Transfer-Code?
   static var wallet_transfer_code_faq_questions_question_3: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_question_3) }
  /// Kann ich den Transfer-Code mehrmals benutzen?
   static var wallet_transfer_code_faq_questions_question_4: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_question_4) }
  /// Mit Transfer-Codes können Covid-Zertifikate schnell und sicher übermittelt werden. Auf diesem Weg erhalten Sie das Covid-Zertifikat, z. B. nach einem Covid-Test, direkt in die App geliefert.
   static var wallet_transfer_code_faq_questions_subtitle: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_subtitle) }
  /// Covid-Zertifikate direkt in die App geliefert
   static var wallet_transfer_code_faq_questions_title: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_questions_title) }
  /// Für den Transfer wird Ihr Covid-Zertifikat verschlüsselt bereitgestellt. Der Transfer-Code stellt sicher, dass nur Ihre App das Covid-Zertifikat empfangen kann. Unmittelbar nach dem Transfer werden die Daten wieder vom Server gelöscht.
   static var wallet_transfer_code_faq_works_answer_1: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_answer_1) }
  /// Sobald das Zertifikat vom Labor oder Testcenter generiert wurde, steht es zum Transfer zur Verfügung. Stellen Sie sicher, dass Ihr Smartphone mit dem Internet verbunden ist, um Zertifikate empfangen zu können.\n\nSollte ihr Covid-Zertifikat dennoch nicht eintreffen, fragen Sie bei der Stelle nach, die den Test durchgeführt hat (Testcenter, Apotheke, Ärztin / Arzt).
   static var wallet_transfer_code_faq_works_answer_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_answer_2) }
  /// Bei einem positiven Antigen-Schnelltest erhalten Sie vom Labor kein Covid-Zertifikat. \n\nBei einem positiven PCR-Test erhalten Sie ein Covid-Zertifikat für Genesene. Es ist ab dem 11. Tag nach der Testentnahme gültig.
   static var wallet_transfer_code_faq_works_answer_3: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_answer_3) }
  /// Die App prüft regelmässig, ob ein Covid-Zertifikat für Ihren Transfer-Code verfügbar ist.
   static var wallet_transfer_code_faq_works_intro_1: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_intro_1) }
  /// Sobald das Covid-Zertifikat verfügbar ist, erscheint es in der App. Wenn Sie Mitteilungen aktiviert haben, werden Sie von der App benachrichtigt.
   static var wallet_transfer_code_faq_works_intro_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_intro_2) }
  /// Nach {TRANSFER_CODE_VALIDITY} Tagen läuft der Transfer-Code ab. Danach wartet die App noch für weitere 72h auf einen möglichen Transfer, bevor der Transfer-Code ungültig wird.
   static var wallet_transfer_code_faq_works_intro_3: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_intro_3) }
  /// Wie sind meine Daten beim Transfer geschützt?
   static var wallet_transfer_code_faq_works_question_1: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_question_1) }
  /// Was kann ich tun, wenn das Zertifikat nicht ankommt?
   static var wallet_transfer_code_faq_works_question_2: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_question_2) }
  /// Was passiert bei einem positiven Testresultat?
   static var wallet_transfer_code_faq_works_question_3: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_question_3) }
  /// So funktioniert der Transfer
   static var wallet_transfer_code_faq_works_title: String { return UBLocalized.tr(Key.wallet_transfer_code_faq_works_title) }
  /// Versuchen Sie es später erneut.
   static var wallet_transfer_code_generate_error_text: String { return UBLocalized.tr(Key.wallet_transfer_code_generate_error_text) }
  /// Ein unerwarteter Fehler ist aufgetreten.
   static var wallet_transfer_code_generate_error_title: String { return UBLocalized.tr(Key.wallet_transfer_code_generate_error_title) }
  /// Um einen Transfer-Code erstellen zu können, muss die App online sein.
   static var wallet_transfer_code_generate_no_internet_error_text: String { return UBLocalized.tr(Key.wallet_transfer_code_generate_no_internet_error_text) }
  /// Nächste Schritte
   static var wallet_transfer_code_next_steps: String { return UBLocalized.tr(Key.wallet_transfer_code_next_steps) }
  /// Übergeben Sie den Code bei der Testentnahme der Apotheke, dem Testcenter oder der Ärztin / dem Arzt.
   static var wallet_transfer_code_next_steps1: String { return UBLocalized.tr(Key.wallet_transfer_code_next_steps1) }
  /// Falls Sie mehrere Zertifikate z. B. von Familienangehörigen empfangen möchten, erstellen Sie für jedes Zertifikat einen neuen Code.
   static var wallet_transfer_code_next_steps2: String { return UBLocalized.tr(Key.wallet_transfer_code_next_steps2) }
  /// Keine Verbindung zum Internet
   static var wallet_transfer_code_no_internet_title: String { return UBLocalized.tr(Key.wallet_transfer_code_no_internet_title) }
  /// Code abgelaufen
   static var wallet_transfer_code_old_code: String { return UBLocalized.tr(Key.wallet_transfer_code_old_code) }
  /// Code erstellen
   static var wallet_transfer_code_onboarding_button: String { return UBLocalized.tr(Key.wallet_transfer_code_onboarding_button) }
  /// So funktioniert's
   static var wallet_transfer_code_onboarding_howto: String { return UBLocalized.tr(Key.wallet_transfer_code_onboarding_howto) }
  /// Sie können Transfer-Codes z. B. bei Covid-Tests angeben. Sie erhalten darauf das Covid-Zertifikat direkt in die App geliefert.
   static var wallet_transfer_code_onboarding_text: String { return UBLocalized.tr(Key.wallet_transfer_code_onboarding_text) }
  /// Transfer Codes
   static var wallet_transfer_code_onboarding_title: String { return UBLocalized.tr(Key.wallet_transfer_code_onboarding_title) }
  /// Transfer fehlgeschlagen
   static var wallet_transfer_code_state_expired: String { return UBLocalized.tr(Key.wallet_transfer_code_state_expired) }
  /// Mit diesem Transfer kann kein Zertifikat mehr empfangen werden.
   static var wallet_transfer_code_state_no_certificate: String { return UBLocalized.tr(Key.wallet_transfer_code_state_no_certificate) }
  /// Zuletzt aktualisiert\n{DATE}
   static var wallet_transfer_code_state_updated: String { return UBLocalized.tr(Key.wallet_transfer_code_state_updated) }
  /// Warten auf Transfer
   static var wallet_transfer_code_state_waiting: String { return UBLocalized.tr(Key.wallet_transfer_code_state_waiting) }
  /// Die Uhrzeit muss richtig eingestellt sein, damit Transfer-Codes funktionieren. Passen Sie Ihre Uhrzeit an und versuchen sie es erneut.
   static var wallet_transfer_code_time_inconsistency_text: String { return UBLocalized.tr(Key.wallet_transfer_code_time_inconsistency_text) }
  /// Uhrzeit Fehler
   static var wallet_transfer_code_time_inconsistency_title: String { return UBLocalized.tr(Key.wallet_transfer_code_time_inconsistency_title) }
  /// Transfer-Code
   static var wallet_transfer_code_title: String { return UBLocalized.tr(Key.wallet_transfer_code_title) }
  /// +41 58 466 07 99
   static var wallet_transfer_code_unexpected_error_phone_number: String { return UBLocalized.tr(Key.wallet_transfer_code_unexpected_error_phone_number) }
  /// Kontaktieren Sie den Support
   static var wallet_transfer_code_unexpected_error_text: String { return UBLocalized.tr(Key.wallet_transfer_code_unexpected_error_text) }
  /// Unerwarteter Fehler
   static var wallet_transfer_code_unexpected_error_title: String { return UBLocalized.tr(Key.wallet_transfer_code_unexpected_error_title) }
  /// Aktualisierung zur Zeit nicht möglich
   static var wallet_transfer_code_update_error_title: String { return UBLocalized.tr(Key.wallet_transfer_code_update_error_title) }
  /// Es ist ein unerwarteter Fehler aufgetreten. Versuchen Sie es später erneut.
   static var wallet_transfer_code_update_general_error_text: String { return UBLocalized.tr(Key.wallet_transfer_code_update_general_error_text) }
  /// Um den Transfer empfangen zu können, muss die App online sein.
   static var wallet_transfer_code_update_no_internet_error_text: String { return UBLocalized.tr(Key.wallet_transfer_code_update_no_internet_error_text) }
  /// Wollen Sie den Transfer-Code wirklich löschen?
   static var wallet_transfer_delete_confirm_text: String { return UBLocalized.tr(Key.wallet_transfer_delete_confirm_text) }
  /// Mit diesem Update können Sie in der App eine Zertifikatskopie ohne Gesundheitsdaten für die Verwendung in der Schweiz generieren lassen. Dazu wurden die Nutzungsbedingungen sowie die Datenschutzerklärung aktualisiert, welche bei Weiternutzung der App als genehmigt gelten.
   static var wallet_update_boarding_certificate_light_text: String { return UBLocalized.tr(Key.wallet_update_boarding_certificate_light_text) }
  /// Zertifikat Light
   static var wallet_update_boarding_certificate_light_title: String { return UBLocalized.tr(Key.wallet_update_boarding_certificate_light_title) }
  /// Update
   static var wallet_update_boarding_header: String { return UBLocalized.tr(Key.wallet_update_boarding_header) }
  /// Neu wird auf dem Covid-Zertifikat das Feld «Gültigkeit in der Schweiz» nicht mehr dargestellt. Stattdessen zeigt die App den Zeitpunkt der Impfung bzw. des Tests an. Warum?
   static var wallet_update_boarding_page_1_text: String { return UBLocalized.tr(Key.wallet_update_boarding_page_1_text) }
  /// Was ist neu?
   static var wallet_update_boarding_page_1_title: String { return UBLocalized.tr(Key.wallet_update_boarding_page_1_title) }
  /// Die Zertifikatspflicht in der Schweiz wurde im Februar 2022 aufgehoben.
   static var wallet_update_boarding_page_2_bullet_1: String { return UBLocalized.tr(Key.wallet_update_boarding_page_2_bullet_1) }
  /// Die Schweizer Gültigkeitsdauern bestehen seitdem nur noch formell und haben im Inland keine praktische Bedeutung mehr.
   static var wallet_update_boarding_page_2_bullet_2: String { return UBLocalized.tr(Key.wallet_update_boarding_page_2_bullet_2) }
  /// Die Schweizer Gültigkeitsdauer hat auch im Ausland keine Bedeutung.
   static var wallet_update_boarding_page_2_bullet_3: String { return UBLocalized.tr(Key.wallet_update_boarding_page_2_bullet_3) }
  /// Covid-Zertifikate \nin der Schweiz
   static var wallet_update_boarding_page_2_title: String { return UBLocalized.tr(Key.wallet_update_boarding_page_2_title) }
  /// Im Ausland gelten die Regeln des entsprechenden Landes.
   static var wallet_update_boarding_page_3_bullet_1: String { return UBLocalized.tr(Key.wallet_update_boarding_page_3_bullet_1) }
  /// Neu zeigt die App an, wie viele Tage eine Impfung bzw. ein Test her ist.
   static var wallet_update_boarding_page_3_bullet_2: String { return UBLocalized.tr(Key.wallet_update_boarding_page_3_bullet_2) }
  /// So können Sie einfacher feststellen, ob Ihr Zertifikat den Regeln Ihres Ziellandes entspricht (falls das Land noch ein Covid-Zertifikat voraussetzt).
   static var wallet_update_boarding_page_3_bullet_3: String { return UBLocalized.tr(Key.wallet_update_boarding_page_3_bullet_3) }
  /// Covid-Zertifikate \nim Ausland
   static var wallet_update_boarding_page_3_title: String { return UBLocalized.tr(Key.wallet_update_boarding_page_3_title) }
  /// Die meisten Länder in Europa haben die Zertifikatspflicht für die Einreise inzwischen aufgehoben.
   static var wallet_update_boarding_page_4_bullet_1: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_bullet_1) }
  /// Die Funktion «Gültigkeit im Ausland» wurde daher ebenfalls entfernt.
   static var wallet_update_boarding_page_4_bullet_2: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_bullet_2) }
  /// Ob in einem Land noch eine Zertifikatspflicht gilt, erfahren Sie auf diesen Webseiten:
   static var wallet_update_boarding_page_4_bullet_3: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_bullet_3) }
  /// reopen.europa.eu
   static var wallet_update_boarding_page_4_link_1_text: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_link_1_text) }
  /// https://reopen.europa.eu
   static var wallet_update_boarding_page_4_link_1_url: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_link_1_url) }
  /// iatatravelcentre.com
   static var wallet_update_boarding_page_4_link_2_text: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_link_2_text) }
  /// https://www.iatatravelcentre.com
   static var wallet_update_boarding_page_4_link_2_url: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_link_2_url) }
  /// Aktuelle Situation in Europa und weltweit
   static var wallet_update_boarding_page_4_title: String { return UBLocalized.tr(Key.wallet_update_boarding_page_4_title) }
  /// UVCI kopiert
   static var wallet_uvci_copied: String { return UBLocalized.tr(Key.wallet_uvci_copied) }
  /// {DAYS} Tagen
   static var wallet_validity_since_days_plural: String { return UBLocalized.tr(Key.wallet_validity_since_days_plural) }
  /// 1 Tag
   static var wallet_validity_since_days_singular: String { return UBLocalized.tr(Key.wallet_validity_since_days_singular) }
  /// {HOURS} Stunden
   static var wallet_validity_since_hours_plural: String { return UBLocalized.tr(Key.wallet_validity_since_hours_plural) }
  /// 1 Stunde
   static var wallet_validity_since_hours_singular: String { return UBLocalized.tr(Key.wallet_validity_since_hours_singular) }
  /// vor mehr als
   static var wallet_validity_since_more_hours_prefix: String { return UBLocalized.tr(Key.wallet_validity_since_more_hours_prefix) }
  /// vor
   static var wallet_validity_since_prefix: String { return UBLocalized.tr(Key.wallet_validity_since_prefix) }
  /// Positiv getestet
   static var wallet_validity_since_recovery_date: String { return UBLocalized.tr(Key.wallet_validity_since_recovery_date) }
  /// Negativ getestet
   static var wallet_validity_since_test_date: String { return UBLocalized.tr(Key.wallet_validity_since_test_date) }
  /// Impfdatum
   static var wallet_validity_since_vaccination_date: String { return UBLocalized.tr(Key.wallet_validity_since_vaccination_date) }
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

class UBLocalizer {
    static var `default` = UBLocalizer()
    func makeDefault() {
        UBLocalizer.default = self
    }

    func translateWithDefaultLanguage(_ key: UBLocalized.Key, _ table: String = "", _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key.rawValue, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }

    public func translate(_ key: UBLocalized.Key, languageKey: String? = nil, table: String = "Localizable", _ args: CVarArg...) -> String {
      guard let languageKey = languageKey else {
        return self.translateWithDefaultLanguage(key, table, args)
      }

      guard let bundlePath = BundleToken.bundle.path(forResource: languageKey, ofType: "lproj"), let bundle = Bundle(path: bundlePath)
      else { return "" }
      return String(format: NSLocalizedString(key.rawValue, bundle: bundle, value: "", comment: ""), locale: Locale.current, arguments: args)
    }
}

private extension UBLocalized {
    private static func tr(_ key: UBLocalized.Key, _ table: String = "Localizable", _ args: CVarArg...) -> String {
      UBLocalizer.default.translate(key, table: table, args)
    }
}

extension UBLocalized {
    public static func translate(_ key: UBLocalized.Key, languageKey: String? = nil, table: String = "Localizable", _ args: CVarArg...) -> String {
        UBLocalizer.default.translate(key, languageKey: languageKey, table: table, args)
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
