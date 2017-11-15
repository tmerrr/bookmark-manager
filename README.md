# Bookmark Manager

## Specification:

* It shows a list of links from the database
* New links can be added
* Links can be tagged
* Links can be filtered by a tag

### User Story 1:

```
As a User
So that I can see my bookmarks
I want to see a list of saved bookmarks
```
BookmarkManager <-- list --> list of saved bookmarks


### User Story 2:

```
As a User
So that I can add to my list of bookmarks
I want to be able to add new bookmarks to the list
```
BookmarkManager <-- add --> add a bookmark

### User Story 3:

```
As a User
To make it easier to access my bookmarks
I want to be able to tag a bookmark
```
Bookmark <-- add_tag --> add tag to bookmark

### User Story 4:
```
As a User
So that I can sort through my bookmarks by category
I want to be able to filter my bookmarks using their tags
```
BookmarkManager <-- filter_by_tag --> see a list of bookmarks with given tag
