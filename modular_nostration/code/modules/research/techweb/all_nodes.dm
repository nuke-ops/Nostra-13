/datum/techweb_node/adv_mining
	id = "bluespace_mining"
	display_name = "Bluespace Mining Technology"
	description = "Harness the power of bluespace to make materials out of nothing. Slowly."
	prereq_ids = list("practical_bluespace", "adv_mining")
	design_ids = list("bluespace_miner")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
