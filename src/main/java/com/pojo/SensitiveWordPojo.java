package com.pojo;

import java.util.Set;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/22.
 */
public class SensitiveWordPojo {
    String excuteTime;
    Set<String> words;
    Integer wordSize;
    String passProb;

    public String getPassProb() {
        return passProb;
    }

    public void setPassProb(String passProb) {
        this.passProb = passProb;
    }

    public SensitiveWordPojo(String excuteTime, Set<String> words, Integer wordSize, String passProb) {

        this.excuteTime = excuteTime;
        this.words = words;
        this.wordSize = wordSize;
        this.passProb = passProb;
    }

    public SensitiveWordPojo() {
    }


    public Integer getWordSize() {

        return wordSize;
    }

    public void setWordSize(Integer wordSize) {
        this.wordSize = wordSize;
    }

    public String getExcuteTime() {

        return excuteTime;
    }

    public void setExcuteTime(String excuteTime) {
        this.excuteTime = excuteTime;
    }

    public Set<String> getWords() {
        return words;
    }

    public void setWords(Set<String> words) {
        this.words = words;
    }

}
