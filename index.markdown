---

layout: default 
title: lian的博客
---
<div class="posts-list">
  <h1>最新文章</h1>

  {% for post in site.posts %}
    <article class="post-item">
      <a href="{{ post.url | relative_url }}">
        <h2 class="post-title">{{ post.title | escape }}</h2>
      </a>
      <time datetime="{{ post.date | date_to_xmlschema }}" class="post-date">{{ post.date | date: "%Y年%m月%d日" }}</time>
      {% if post.categories %}
        <span class="post-categories">
          分类：
          {% for category in post.categories %}
            <a href="{{ site.baseurl | append: '/categories/' | append: category | slugify | append: '/' }}">{{ category }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
      {% endif %}
      {% if post.tags %}
        <span class="post-tags">
          标签：
          {% for tag in post.tags %}
            <a href="{{ site.baseurl | append: '/tags/' | append: tag | slugify | append: '/' }}">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        </span>
      {% endif %}

      <div class="post-excerpt">
        <!-- 你可以选择显示文章的摘要，或者只显示标题和日期 -->
        {{ post.excerpt | strip_html | truncate: 150 }} <!-- 显示摘要，截断到150字 -->
        <a href="{{ post.url | relative_url }}" class="read-more">继续阅读 &raquo;</a>
      </div>
    </article>
  {% endfor %}
</div>