package com.model;

import java.util.ArrayList;
import java.util.List;

public class KlKnowledgeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public KlKnowledgeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andKlIdIsNull() {
            addCriterion("kl_id is null");
            return (Criteria) this;
        }

        public Criteria andKlIdIsNotNull() {
            addCriterion("kl_id is not null");
            return (Criteria) this;
        }

        public Criteria andKlIdEqualTo(Integer value) {
            addCriterion("kl_id =", value, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdNotEqualTo(Integer value) {
            addCriterion("kl_id <>", value, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdGreaterThan(Integer value) {
            addCriterion("kl_id >", value, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_id >=", value, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdLessThan(Integer value) {
            addCriterion("kl_id <", value, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdLessThanOrEqualTo(Integer value) {
            addCriterion("kl_id <=", value, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdIn(List<Integer> values) {
            addCriterion("kl_id in", values, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdNotIn(List<Integer> values) {
            addCriterion("kl_id not in", values, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdBetween(Integer value1, Integer value2) {
            addCriterion("kl_id between", value1, value2, "klId");
            return (Criteria) this;
        }

        public Criteria andKlIdNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_id not between", value1, value2, "klId");
            return (Criteria) this;
        }

        public Criteria andKlKindIsNull() {
            addCriterion("kl_kind is null");
            return (Criteria) this;
        }

        public Criteria andKlKindIsNotNull() {
            addCriterion("kl_kind is not null");
            return (Criteria) this;
        }

        public Criteria andKlKindEqualTo(Integer value) {
            addCriterion("kl_kind =", value, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindNotEqualTo(Integer value) {
            addCriterion("kl_kind <>", value, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindGreaterThan(Integer value) {
            addCriterion("kl_kind >", value, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_kind >=", value, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindLessThan(Integer value) {
            addCriterion("kl_kind <", value, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindLessThanOrEqualTo(Integer value) {
            addCriterion("kl_kind <=", value, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindIn(List<Integer> values) {
            addCriterion("kl_kind in", values, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindNotIn(List<Integer> values) {
            addCriterion("kl_kind not in", values, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindBetween(Integer value1, Integer value2) {
            addCriterion("kl_kind between", value1, value2, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlKindNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_kind not between", value1, value2, "klKind");
            return (Criteria) this;
        }

        public Criteria andKlTitleIsNull() {
            addCriterion("kl_title is null");
            return (Criteria) this;
        }

        public Criteria andKlTitleIsNotNull() {
            addCriterion("kl_title is not null");
            return (Criteria) this;
        }

        public Criteria andKlTitleEqualTo(String value) {
            addCriterion("kl_title =", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleNotEqualTo(String value) {
            addCriterion("kl_title <>", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleGreaterThan(String value) {
            addCriterion("kl_title >", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleGreaterThanOrEqualTo(String value) {
            addCriterion("kl_title >=", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleLessThan(String value) {
            addCriterion("kl_title <", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleLessThanOrEqualTo(String value) {
            addCriterion("kl_title <=", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleLike(String value) {
            addCriterion("kl_title like", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleNotLike(String value) {
            addCriterion("kl_title not like", value, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleIn(List<String> values) {
            addCriterion("kl_title in", values, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleNotIn(List<String> values) {
            addCriterion("kl_title not in", values, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleBetween(String value1, String value2) {
            addCriterion("kl_title between", value1, value2, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlTitleNotBetween(String value1, String value2) {
            addCriterion("kl_title not between", value1, value2, "klTitle");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionIsNull() {
            addCriterion("kl_introduction is null");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionIsNotNull() {
            addCriterion("kl_introduction is not null");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionEqualTo(String value) {
            addCriterion("kl_introduction =", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionNotEqualTo(String value) {
            addCriterion("kl_introduction <>", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionGreaterThan(String value) {
            addCriterion("kl_introduction >", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionGreaterThanOrEqualTo(String value) {
            addCriterion("kl_introduction >=", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionLessThan(String value) {
            addCriterion("kl_introduction <", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionLessThanOrEqualTo(String value) {
            addCriterion("kl_introduction <=", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionLike(String value) {
            addCriterion("kl_introduction like", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionNotLike(String value) {
            addCriterion("kl_introduction not like", value, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionIn(List<String> values) {
            addCriterion("kl_introduction in", values, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionNotIn(List<String> values) {
            addCriterion("kl_introduction not in", values, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionBetween(String value1, String value2) {
            addCriterion("kl_introduction between", value1, value2, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlIntroductionNotBetween(String value1, String value2) {
            addCriterion("kl_introduction not between", value1, value2, "klIntroduction");
            return (Criteria) this;
        }

        public Criteria andKlContentIsNull() {
            addCriterion("kl_content is null");
            return (Criteria) this;
        }

        public Criteria andKlContentIsNotNull() {
            addCriterion("kl_content is not null");
            return (Criteria) this;
        }

        public Criteria andKlContentEqualTo(String value) {
            addCriterion("kl_content =", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentNotEqualTo(String value) {
            addCriterion("kl_content <>", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentGreaterThan(String value) {
            addCriterion("kl_content >", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentGreaterThanOrEqualTo(String value) {
            addCriterion("kl_content >=", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentLessThan(String value) {
            addCriterion("kl_content <", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentLessThanOrEqualTo(String value) {
            addCriterion("kl_content <=", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentLike(String value) {
            addCriterion("kl_content like", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentNotLike(String value) {
            addCriterion("kl_content not like", value, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentIn(List<String> values) {
            addCriterion("kl_content in", values, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentNotIn(List<String> values) {
            addCriterion("kl_content not in", values, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentBetween(String value1, String value2) {
            addCriterion("kl_content between", value1, value2, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlContentNotBetween(String value1, String value2) {
            addCriterion("kl_content not between", value1, value2, "klContent");
            return (Criteria) this;
        }

        public Criteria andKlTagsIsNull() {
            addCriterion("kl_tags is null");
            return (Criteria) this;
        }

        public Criteria andKlTagsIsNotNull() {
            addCriterion("kl_tags is not null");
            return (Criteria) this;
        }

        public Criteria andKlTagsEqualTo(String value) {
            addCriterion("kl_tags =", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsNotEqualTo(String value) {
            addCriterion("kl_tags <>", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsGreaterThan(String value) {
            addCriterion("kl_tags >", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsGreaterThanOrEqualTo(String value) {
            addCriterion("kl_tags >=", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsLessThan(String value) {
            addCriterion("kl_tags <", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsLessThanOrEqualTo(String value) {
            addCriterion("kl_tags <=", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsLike(String value) {
            addCriterion("kl_tags like", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsNotLike(String value) {
            addCriterion("kl_tags not like", value, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsIn(List<String> values) {
            addCriterion("kl_tags in", values, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsNotIn(List<String> values) {
            addCriterion("kl_tags not in", values, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsBetween(String value1, String value2) {
            addCriterion("kl_tags between", value1, value2, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlTagsNotBetween(String value1, String value2) {
            addCriterion("kl_tags not between", value1, value2, "klTags");
            return (Criteria) this;
        }

        public Criteria andKlAppendixIsNull() {
            addCriterion("kl_appendix is null");
            return (Criteria) this;
        }

        public Criteria andKlAppendixIsNotNull() {
            addCriterion("kl_appendix is not null");
            return (Criteria) this;
        }

        public Criteria andKlAppendixEqualTo(String value) {
            addCriterion("kl_appendix =", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNotEqualTo(String value) {
            addCriterion("kl_appendix <>", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixGreaterThan(String value) {
            addCriterion("kl_appendix >", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixGreaterThanOrEqualTo(String value) {
            addCriterion("kl_appendix >=", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixLessThan(String value) {
            addCriterion("kl_appendix <", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixLessThanOrEqualTo(String value) {
            addCriterion("kl_appendix <=", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixLike(String value) {
            addCriterion("kl_appendix like", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNotLike(String value) {
            addCriterion("kl_appendix not like", value, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixIn(List<String> values) {
            addCriterion("kl_appendix in", values, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNotIn(List<String> values) {
            addCriterion("kl_appendix not in", values, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixBetween(String value1, String value2) {
            addCriterion("kl_appendix between", value1, value2, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNotBetween(String value1, String value2) {
            addCriterion("kl_appendix not between", value1, value2, "klAppendix");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberIsNull() {
            addCriterion("kl_appendix_number is null");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberIsNotNull() {
            addCriterion("kl_appendix_number is not null");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberEqualTo(Integer value) {
            addCriterion("kl_appendix_number =", value, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberNotEqualTo(Integer value) {
            addCriterion("kl_appendix_number <>", value, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberGreaterThan(Integer value) {
            addCriterion("kl_appendix_number >", value, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_appendix_number >=", value, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberLessThan(Integer value) {
            addCriterion("kl_appendix_number <", value, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberLessThanOrEqualTo(Integer value) {
            addCriterion("kl_appendix_number <=", value, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberIn(List<Integer> values) {
            addCriterion("kl_appendix_number in", values, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberNotIn(List<Integer> values) {
            addCriterion("kl_appendix_number not in", values, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberBetween(Integer value1, Integer value2) {
            addCriterion("kl_appendix_number between", value1, value2, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlAppendixNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_appendix_number not between", value1, value2, "klAppendixNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoIsNull() {
            addCriterion("kl_video is null");
            return (Criteria) this;
        }

        public Criteria andKlVideoIsNotNull() {
            addCriterion("kl_video is not null");
            return (Criteria) this;
        }

        public Criteria andKlVideoEqualTo(String value) {
            addCriterion("kl_video =", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoNotEqualTo(String value) {
            addCriterion("kl_video <>", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoGreaterThan(String value) {
            addCriterion("kl_video >", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoGreaterThanOrEqualTo(String value) {
            addCriterion("kl_video >=", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoLessThan(String value) {
            addCriterion("kl_video <", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoLessThanOrEqualTo(String value) {
            addCriterion("kl_video <=", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoLike(String value) {
            addCriterion("kl_video like", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoNotLike(String value) {
            addCriterion("kl_video not like", value, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoIn(List<String> values) {
            addCriterion("kl_video in", values, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoNotIn(List<String> values) {
            addCriterion("kl_video not in", values, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoBetween(String value1, String value2) {
            addCriterion("kl_video between", value1, value2, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoNotBetween(String value1, String value2) {
            addCriterion("kl_video not between", value1, value2, "klVideo");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberIsNull() {
            addCriterion("kl_video_number is null");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberIsNotNull() {
            addCriterion("kl_video_number is not null");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberEqualTo(Integer value) {
            addCriterion("kl_video_number =", value, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberNotEqualTo(Integer value) {
            addCriterion("kl_video_number <>", value, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberGreaterThan(Integer value) {
            addCriterion("kl_video_number >", value, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_video_number >=", value, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberLessThan(Integer value) {
            addCriterion("kl_video_number <", value, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberLessThanOrEqualTo(Integer value) {
            addCriterion("kl_video_number <=", value, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberIn(List<Integer> values) {
            addCriterion("kl_video_number in", values, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberNotIn(List<Integer> values) {
            addCriterion("kl_video_number not in", values, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberBetween(Integer value1, Integer value2) {
            addCriterion("kl_video_number between", value1, value2, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlVideoNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_video_number not between", value1, value2, "klVideoNumber");
            return (Criteria) this;
        }

        public Criteria andKlHintsIsNull() {
            addCriterion("kl_hints is null");
            return (Criteria) this;
        }

        public Criteria andKlHintsIsNotNull() {
            addCriterion("kl_hints is not null");
            return (Criteria) this;
        }

        public Criteria andKlHintsEqualTo(Integer value) {
            addCriterion("kl_hints =", value, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsNotEqualTo(Integer value) {
            addCriterion("kl_hints <>", value, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsGreaterThan(Integer value) {
            addCriterion("kl_hints >", value, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_hints >=", value, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsLessThan(Integer value) {
            addCriterion("kl_hints <", value, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsLessThanOrEqualTo(Integer value) {
            addCriterion("kl_hints <=", value, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsIn(List<Integer> values) {
            addCriterion("kl_hints in", values, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsNotIn(List<Integer> values) {
            addCriterion("kl_hints not in", values, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsBetween(Integer value1, Integer value2) {
            addCriterion("kl_hints between", value1, value2, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlHintsNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_hints not between", value1, value2, "klHints");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberIsNull() {
            addCriterion("kl_collection_number is null");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberIsNotNull() {
            addCriterion("kl_collection_number is not null");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberEqualTo(Integer value) {
            addCriterion("kl_collection_number =", value, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberNotEqualTo(Integer value) {
            addCriterion("kl_collection_number <>", value, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberGreaterThan(Integer value) {
            addCriterion("kl_collection_number >", value, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_collection_number >=", value, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberLessThan(Integer value) {
            addCriterion("kl_collection_number <", value, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberLessThanOrEqualTo(Integer value) {
            addCriterion("kl_collection_number <=", value, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberIn(List<Integer> values) {
            addCriterion("kl_collection_number in", values, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberNotIn(List<Integer> values) {
            addCriterion("kl_collection_number not in", values, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberBetween(Integer value1, Integer value2) {
            addCriterion("kl_collection_number between", value1, value2, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlCollectionNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_collection_number not between", value1, value2, "klCollectionNumber");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsIsNull() {
            addCriterion("kl_connect_ids is null");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsIsNotNull() {
            addCriterion("kl_connect_ids is not null");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsEqualTo(String value) {
            addCriterion("kl_connect_ids =", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsNotEqualTo(String value) {
            addCriterion("kl_connect_ids <>", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsGreaterThan(String value) {
            addCriterion("kl_connect_ids >", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsGreaterThanOrEqualTo(String value) {
            addCriterion("kl_connect_ids >=", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsLessThan(String value) {
            addCriterion("kl_connect_ids <", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsLessThanOrEqualTo(String value) {
            addCriterion("kl_connect_ids <=", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsLike(String value) {
            addCriterion("kl_connect_ids like", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsNotLike(String value) {
            addCriterion("kl_connect_ids not like", value, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsIn(List<String> values) {
            addCriterion("kl_connect_ids in", values, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsNotIn(List<String> values) {
            addCriterion("kl_connect_ids not in", values, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsBetween(String value1, String value2) {
            addCriterion("kl_connect_ids between", value1, value2, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlConnectIdsNotBetween(String value1, String value2) {
            addCriterion("kl_connect_ids not between", value1, value2, "klConnectIds");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdIsNull() {
            addCriterion("kl_parent_file_id is null");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdIsNotNull() {
            addCriterion("kl_parent_file_id is not null");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdEqualTo(Integer value) {
            addCriterion("kl_parent_file_id =", value, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdNotEqualTo(Integer value) {
            addCriterion("kl_parent_file_id <>", value, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdGreaterThan(Integer value) {
            addCriterion("kl_parent_file_id >", value, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("kl_parent_file_id >=", value, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdLessThan(Integer value) {
            addCriterion("kl_parent_file_id <", value, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdLessThanOrEqualTo(Integer value) {
            addCriterion("kl_parent_file_id <=", value, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdIn(List<Integer> values) {
            addCriterion("kl_parent_file_id in", values, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdNotIn(List<Integer> values) {
            addCriterion("kl_parent_file_id not in", values, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdBetween(Integer value1, Integer value2) {
            addCriterion("kl_parent_file_id between", value1, value2, "klParentFileId");
            return (Criteria) this;
        }

        public Criteria andKlParentFileIdNotBetween(Integer value1, Integer value2) {
            addCriterion("kl_parent_file_id not between", value1, value2, "klParentFileId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}