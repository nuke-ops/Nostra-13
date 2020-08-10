/datum/techweb_node/bs_mining
	id = "bluespace_mining"
	display_name = "Bluespace Mining Technology"
	description = "Through the power of Bluespace-Assisted A.S.S Compression it is possible to mine resources."
	prereq_ids = list("practical_bluespace", "adv_mining")
	design_ids = list("bluespace_miner")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)
