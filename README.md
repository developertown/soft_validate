[![Build Status](https://secure.travis-ci.org/developertown/soft_validate.png)](http://travis-ci.org/developertown/soft_validate)


Soft Validate
=============

Easily recommend fields be filled out in order for something to be considered complete (AKA LinkedIn profile progress)

Install
-------
    gem install 'soft_validate'

Usage
-----
Add this to your model:

    soft_validates_presence_of :name

And you will get methods like this:

    user.soft_valid?
    user.soft_errors
    user.progress_percent
    user.progress_count
    user.progress_complete_count

License
-------

MIT License
