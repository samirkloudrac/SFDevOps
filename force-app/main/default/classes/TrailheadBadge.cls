public with sharing class TrailheadBadge {
    public TrailheadBadge() {
        System.System.debug('Welcome to trailhead badhge count');
    }
    public static void badge(integer b,integer p){
        if(b==0 && p<200){
            System.debug('Your Trailblazer Rank is :SCOUT');
        }
        else if(b>=1 && b<5 && p>=200){
            System.debug('Your Trailblazer Rank is :HIKER');
        }
        else if(b>=5 && b<10 && p>=3000){
            System.debug('Your Trailblazer Rank is :EXPLORER');
        }
        else if(b>=10 && b<25 && p>=9000){
            System.debug('Your Trailblazer Rank is :ADVENTURER');
        }
        else if(b>=25 && b<50 && p>=18000){
            System.debug('Your Trailblazer Rank is :MOUNTAINEER');
        }
        else if(b>=50 && b<100 && p>=35000){
            System.debug('Your Trailblazer Rank is :EXPEDITIONER');
        }
         else if(b>=100 && p>=50000){
            System.debug('Your Trailblazer Rank is :RANGER');
        }
        else{
            System.debug('No data found');
        }
        
    }

}