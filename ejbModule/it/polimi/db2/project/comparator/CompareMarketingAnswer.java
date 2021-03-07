package it.polimi.db2.project.comparator;

import java.util.Comparator;

import it.polimi.db2.project.entities.MarketingAnswer;

public class CompareMarketingAnswer implements Comparator<MarketingAnswer>{

	@Override
	public int compare(MarketingAnswer a1, MarketingAnswer a2) {
		return a1.getQuestion().getOrdering() -  a2.getQuestion().getOrdering();
	}
	
}
