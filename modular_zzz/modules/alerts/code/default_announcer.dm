/datum/centcom_announcer/default
	welcome_sounds = list('modular_zzz/sound/announcer/default/welcome.ogg')
	alert_sounds = list('modular_skyrat/modules/alerts/sound/alerts/alert2.ogg')
	command_report_sounds = list('modular_zzz/sound/announcer/default/commandreport.ogg')
	event_sounds = list(
		ANNOUNCER_AIMALF = 'modular_zzz/sound/announcer/default/aimalf.ogg',
		ANNOUNCER_ALIENS = 'modular_zzz/sound/announcer/default/lifesigns.ogg', // Нужно улучшение.
		ANNOUNCER_ANIMES = 'modular_zzz/sound/announcer/default/animes.ogg', // Нужен перевод.
		ANNOUNCER_INTERCEPT = 'modular_skyrat/modules/alerts/sound/alerts/alert2.ogg',
		ANNOUNCER_IONSTORM = list('modular_zzz/sound/announcer/default/ionstorm1.ogg', \
		'modular_zzz/sound/announcer/default/ionstorm2.ogg', 'modular_zzz/sound/announcer/default/ionstorm3.ogg'),
		ANNOUNCER_METEORS = 'modular_zzz/sound/announcer/default/meteors.ogg',
		ANNOUNCER_OUTBREAK5 = 'modular_zzz/sound/announcer/default/outbreak5.ogg',
		ANNOUNCER_OUTBREAK6 = 'modular_skyrat/modules/alerts/sound/alerts/alert3.ogg',
		ANNOUNCER_OUTBREAK7 = 'modular_zzz/sound/announcer/default/outbreak7.ogg',
		ANNOUNCER_POWEROFF = list('modular_zzz/sound/announcer/default/poweroff.ogg', 'modular_zzz/sound/announcer/default/poweroff2.ogg', \
		'modular_zzz/sound/announcer/default/poweroff2.ogg', 'modular_zzz/sound/announcer/default/poweroff2.ogg', \
		'modular_zzz/sound/announcer/default/poweroff2.ogg', 'modular_zzz/sound/announcer/default/poweroff2.ogg', \
		'modular_zzz/sound/announcer/default/poweroff2.ogg', 'modular_zzz/sound/announcer/poweroff_boomer.ogg'),
		ANNOUNCER_POWERON = list('modular_zzz/sound/announcer/default/poweron1.ogg', 'modular_zzz/sound/announcer/default/poweron2.ogg'),
		ANNOUNCER_RADIATION = 'modular_zzz/sound/announcer/default/radiation.ogg',
		ANNOUNCER_RADIATIONPASSED = 'modular_skyrat/modules/alerts/sound/alerts/radpassed.ogg', // Нужен перевод.
		ANNOUNCER_SHUTTLECALLED = 'modular_zzz/sound/announcer/default/shuttlecalled.ogg',
		ANNOUNCER_SHUTTLEDOCK = 'modular_zzz/sound/announcer/default/shuttledock.ogg',
		ANNOUNCER_SHUTTLERECALLED = 'modular_zzz/sound/announcer/default/shuttlerecalled.ogg',
		ANNOUNCER_SHUTTLELEFT = 'modular_skyrat/modules/alerts/sound/alerts/crew_shuttle_left.ogg', // Нужен перевод.
		ANNOUNCER_ANOMALIES = 'modular_skyrat/modules/alerts/sound/alerts/alert2.ogg',
		ANNOUNCER_GRAVANOMALIES= 'modular_zzz/sound/announcer/default/anomaly_grav.ogg',
		ANNOUNCER_SPANOMALIES = 'modular_zzz/sound/announcer/default/spanomalies.ogg',
		ANNOUNCER_VORTEXANOMALIES = 'modular_zzz/sound/announcer/default/anomaly_vortex.ogg',
		ANNOUNCER_MASSIVEBSPACEANOMALIES = 'modular_zzz/sound/announcer/default/anomaly_bluespace.ogg',
		ANNOUNCER_TRANSLOCATION = 'modular_skyrat/modules/alerts/sound/alerts/transolcation.ogg', // Нужен перевод.
		ANNOUNCER_FLUXANOMALIES = 'modular_zzz/sound/announcer/default/anomaly_flux.ogg',
		ANNOUNCER_PYROANOMALIES = 'modular_zzz/sound/announcer/default/anomaly_pyro.ogg',
		ANNOUNCER_DIMENSIONAL = 'modular_zzz/sound/announcer/default/anomaly_dimensional.ogg',
		ANNOUNCER_ECTOPLASM = 'modular_zzz/sound/announcer/default/anomaly_ectoplasm.ogg',
		ANNOUNCER_CARP = 'modular_zzz/sound/announcer/default/lifesigns.ogg', // Нужно улучшение.
		ANNOUNCER_BLUESPACEARTY = 'modular_zzz/sound/announcer/default/artillery.ogg',
		ANNOUNCER_CAPTAIN = 'sound/announcer/announcement/announce.ogg',
		ANNOUNCER_GRAVGENOFF = 'modular_zzz/sound/announcer/default/gravityoff.ogg',
		ANNOUNCER_GRAVGENON = 'modular_zzz/sound/announcer/default/gravityon.ogg',
		ANNOUNCER_GREYTIDE = 'modular_skyrat/modules/alerts/sound/alerts/greytide.ogg', // Нужен перевод.
		ANNOUNCER_COMMSBLACKOUT = 'modular_skyrat/modules/alerts/sound/alerts/commsblackout.ogg',
		ANNOUNCER_ELECTRICALSTORM = 'modular_skyrat/modules/alerts/sound/alerts/estorm.ogg', // Нужен перевод.
		ANNOUNCER_BRANDINTELLIGENCE = 'modular_skyrat/modules/alerts/sound/alerts/rampant_brand_int.ogg', // Нужен перевод.
		ANNOUNCER_SPOOKY = 'modular_skyrat/modules/alerts/sound/misc/admin_horror_music.ogg',
		ANNOUNCER_ERTYES = 'modular_zzz/sound/announcer/default/ert_yes.ogg',
		ANNOUNCER_ERTNO = 'modular_zzz/sound/announcer/default/ert_no.ogg',
		ANNOUNCER_MUTANTS = 'modular_skyrat/modules/alerts/sound/alerts/hazdet.ogg', // Нужен перевод.
		ANNOUNCER_KLAXON = 'modular_skyrat/modules/black_mesa/sound/siren1_long.ogg',
		ANNOUNCER_ICARUS = 'modular_skyrat/modules/assault_operatives/sound/icarus_alarm.ogg',
		ANNOUNCER_NRI_RAIDERS = 'modular_skyrat/modules/encounters/sounds/morse.ogg',
		ANNOUNCER_DEPARTMENTAL = 'modular_skyrat/modules/alerts/sound/alerts/alert3.ogg',
		ANNOUNCER_SHUTTLE = 'modular_skyrat/modules/alerts/sound/alerts/alert3.ogg',
		ANNOUNCER_GRAVGENBLACKOUT = 'modular_zzz/sound/announcer/default/gravityoff.ogg',
		ANNOUNCER_METEORWARNING = 'modular_zzz/sound/announcer/default/meteors.ogg',
		ANNOUNCER_ADMIN_1 = 'modular_zzz/sound/announcer/default/_admin_cap_gone.ogg',
		ANNOUNCER_ADMIN_2 = 'modular_zzz/sound/announcer/default/_admin_capitain.ogg',
		ANNOUNCER_ADMIN_3 = 'modular_zzz/sound/announcer/default/_admin_hos_gone.ogg',
		ANNOUNCER_ADMIN_4 = 'modular_zzz/sound/announcer/default/_admin_war_pipisky.ogg',
		ANNOUNCER_ADMIN_5 = 'modular_zzz/sound/announcer/default/_admin_war_pizdec.ogg',
		ANNOUNCER_ADMIN_6 = 'modular_zzz/sound/announcer/default/_admin_war_tishina.ogg',
		)
