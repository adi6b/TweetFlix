/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserTweetsPkg;

/**
 *
 * @author agashe
 */
import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.neural.rnn.RNNCoreAnnotations;
import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;
import edu.stanford.nlp.sentiment.SentimentCoreAnnotations;
import edu.stanford.nlp.trees.Tree;
import edu.stanford.nlp.util.CoreMap;
import java.util.ArrayList;

public class NLP {
	static StanfordCoreNLP pipeline;

	public static void init() {
		pipeline = new StanfordCoreNLP("MyPropFile.properties");
	}

	public static int findSentiment(String tweet) {

		int mainSentiment = 0;
		if (tweet != null && tweet.length() > 0) {
			int longest = 0;
			Annotation annotation = pipeline.process(tweet);
			for (CoreMap sentence : annotation
					.get(CoreAnnotations.SentencesAnnotation.class)) {
				

                                Tree tree = sentence.get(SentimentCoreAnnotations.SentimentAnnotatedTree.class);
				int sentiment = RNNCoreAnnotations.getPredictedClass(tree);
				String partText = sentence.toString();
				if (partText.length() > longest) {
					mainSentiment = sentiment;
					longest = partText.length();
				}

			}
		}
		return mainSentiment;
                // "Very negative" = 0 "Negative" = 1 "Neutral" = 2 "Positive" = 3 "Very positive" = 4
	}
        
//        
//        public static void main(String[] args) {
//
//                ArrayList<String> tweets = new ArrayList<String>();
//                tweets.add("Hey Dangal is a wonderful movie");
//                tweets.add("Bad movie Race3");
//                tweets.add("Inception is a fantastic mind-blowing movie");
//		NLP.init();
//		for(String tweet : tweets) {
//			System.out.println(tweet + " : " + NLP.findSentiment(tweet));
//		}
//	}
}