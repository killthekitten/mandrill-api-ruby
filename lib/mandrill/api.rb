module Mandrill


    class Templates
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Add a new template
        # @param [String] name the name for the new template - must be unique
        # @param [String] from_email a default sending address for emails sent using this template
        # @param [String] from_name a default from name to be used
        # @param [String] subject a default subject line to be used
        # @param [String] code the HTML code for the template with mc:edit attributes for the editable elements
        # @param [String] text a default text part to be used when sending with this template
        # @param [Boolean] publish set to false to add a draft template without publishing
        # @return [Hash] the information saved about the new template
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def add(name, from_email=nil, from_name=nil, subject=nil, code=nil, text=nil, publish=true)
            _params = {:name => name, :from_email => from_email, :from_name => from_name, :subject => subject, :code => code, :text => text, :publish => publish}
            return @master.call 'templates/add', _params
        end

        # Get the information for an existing template
        # @param [String] name the immutable name of an existing template
        # @return [Hash] the requested template information
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def info(name)
            _params = {:name => name}
            return @master.call 'templates/info', _params
        end

        # Update the code for an existing template. If null is provided for any fields, the values will remain unchanged.
        # @param [String] name the immutable name of an existing template
        # @param [String] from_email the new default sending address
        # @param [String] from_name the new default from name
        # @param [String] subject the new default subject line
        # @param [String] code the new code for the template
        # @param [String] text the new default text part to be used
        # @param [Boolean] publish set to false to update the draft version of the template without publishing
        # @return [Hash] the template that was updated
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def update(name, from_email=nil, from_name=nil, subject=nil, code=nil, text=nil, publish=true)
            _params = {:name => name, :from_email => from_email, :from_name => from_name, :subject => subject, :code => code, :text => text, :publish => publish}
            return @master.call 'templates/update', _params
        end

        # Publish the content for the template. Any new messages sent using this template will start using the content that was previously in draft.
        # @param [String] name the immutable name of an existing template
        # @return [Hash] the template that was published
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def publish(name)
            _params = {:name => name}
            return @master.call 'templates/publish', _params
        end

        # Delete a template
        # @param [String] name the immutable name of an existing template
        # @return [Hash] the template that was deleted
        #     - [String] slug the immutable unique code name of the template
        #     - [String] name the name of the template
        #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #     - [String] subject the subject line of the template, if provided - draft version
        #     - [String] from_email the default sender address for the template, if provided - draft version
        #     - [String] from_name the default sender from name for the template, if provided - draft version
        #     - [String] text the default text part of messages sent with the template, if provided - draft version
        #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #     - [String] publish_subject the subject line of the template, if provided
        #     - [String] publish_from_email the default sender address for the template, if provided
        #     - [String] publish_from_name the default sender from name for the template, if provided
        #     - [String] publish_text the default text part of messages sent with the template, if provided
        #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def delete(name)
            _params = {:name => name}
            return @master.call 'templates/delete', _params
        end

        # Return a list of all the templates available to this user
        # @return [Array] an array of structs with information about each template
        #     - [Hash] return[] the information on each template in the account
        #         - [String] slug the immutable unique code name of the template
        #         - [String] name the name of the template
        #         - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
        #         - [String] subject the subject line of the template, if provided - draft version
        #         - [String] from_email the default sender address for the template, if provided - draft version
        #         - [String] from_name the default sender from name for the template, if provided - draft version
        #         - [String] text the default text part of messages sent with the template, if provided - draft version
        #         - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
        #         - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
        #         - [String] publish_subject the subject line of the template, if provided
        #         - [String] publish_from_email the default sender address for the template, if provided
        #         - [String] publish_from_name the default sender from name for the template, if provided
        #         - [String] publish_text the default text part of messages sent with the template, if provided
        #         - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
        #         - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
        def list()
            _params = {}
            return @master.call 'templates/list', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a template
        # @param [String] name the name of an existing template
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def time_series(name)
            _params = {:name => name}
            return @master.call 'templates/time-series', _params
        end

        # Inject content and optionally merge fields into a template, returning the HTML that results
        # @param [String] template_name the immutable name of a template that exists in the user's account
        # @param [Array] template_content an array of template content to render.  Each item in the array should be a struct with two keys - name: the name of the content block to set the content for, and content: the actual content to put into the block
        #     - [Hash] template_content[] the injection of a single piece of content into a single editable region
        #         - [String] name the name of the mc:edit editable region to inject into
        #         - [String] content the content to inject
        # @param [Array] merge_vars optional merge variables to use for injecting merge field content.  If this is not provided, no merge fields will be replaced.
        #     - [Hash] merge_vars[] a single merge variable
        #         - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
        #         - [String] content the merge variable's content
        # @return [Hash] the result of rendering the given template with the content and merge field values injected
        #     - [String] html the rendered HTML as a string
        def render(template_name, template_content, merge_vars=nil)
            _params = {:template_name => template_name, :template_content => template_content, :merge_vars => merge_vars}
            return @master.call 'templates/render', _params
        end

    end
    class Exports
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Returns information about an export job. If the export job's state is 'complete', the returned data will include a URL you can use to fetch the results. Every export job produces a zip archive, but the format of the archive is distinct for each job type. The api calls that initiate exports include more details about the output format for that job type.
        # @param [String] id an export job identifier
        # @return [Hash] the information about the export
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job - activity, reject, or whitelist
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] state the export job's state - waiting, working, complete, error, or expired.
        #     - [String] result_url the url for the export job's results, if the job is completed.
        def info(id)
            _params = {:id => id}
            return @master.call 'exports/info', _params
        end

        # Returns a list of your exports.
        # @return [Array] the account's exports
        #     - [Hash] return[] the individual export info
        #         - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #         - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] type the type of the export job - activity, reject, or whitelist
        #         - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] state the export job's state - waiting, working, complete, error, or expired.
        #         - [String] result_url the url for the export job's results, if the job is completed.
        def list()
            _params = {}
            return @master.call 'exports/list', _params
        end

        # Begins an export of your rejection blacklist. The blacklist will be exported to a zip archive containing a single file named rejects.csv that includes the following fields: email, reason, detail, created_at, expires_at, last_event_at, expires_at.
        # @param [String] notify_email an optional email address to notify when the export job has finished.
        # @return [Hash] information about the rejects export job that was started
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
        #     - [String] state the export job's state
        #     - [String] result_url the url for the export job's results, if the job is complete
        def rejects(notify_email=nil)
            _params = {:notify_email => notify_email}
            return @master.call 'exports/rejects', _params
        end

        # Begins an export of your rejection whitelist. The whitelist will be exported to a zip archive containing a single file named whitelist.csv that includes the following fields: email, detail, created_at.
        # @param [String] notify_email an optional email address to notify when the export job has finished.
        # @return [Hash] information about the whitelist export job that was started
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
        #     - [String] state the export job's state
        #     - [String] result_url the url for the export job's results, if the job is complete
        def whitelist(notify_email=nil)
            _params = {:notify_email => notify_email}
            return @master.call 'exports/whitelist', _params
        end

        # Begins an export of your activity history. The activity will be exported to a zip archive containing a single file named activity.csv in the same format as you would be able to export from your account's activity view. It includes the following fields: Date, Email Address, Sender, Subject, Status, Tags, Opens, Clicks, Bounce Detail. If you have configured any custom metadata fields, they will be included in the exported data.
        # @param [String] notify_email an optional email address to notify when the export job has finished
        # @param [String] date_from start date as a UTC string in YYYY-MM-DD HH:MM:SS format
        # @param [String] date_to end date as a UTC string in YYYY-MM-DD HH:MM:SS format
        # @param [Array] tags an array of tag names to narrow the export to; will match messages that contain ANY of the tags
        #     - [String] tags[] a tag name
        # @param [Array] senders an array of senders to narrow the export to
        #     - [String] senders[] a sender address
        # @param [Array] states an array of states to narrow the export to; messages with ANY of the states will be included
        #     - [String] states[] a message state
        # @return [Hash] information about the activity export job that was started
        #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
        #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] type the type of the export job
        #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
        #     - [String] state the export job's state
        #     - [String] result_url the url for the export job's results, if the job is complete
        def activity(notify_email=nil, date_from=nil, date_to=nil, tags=nil, senders=nil, states=nil)
            _params = {:notify_email => notify_email, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders, :states => states}
            return @master.call 'exports/activity', _params
        end

    end
    class Users
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Return the information about the API-connected user
        # @return [Hash] the user information including username, key, reputation, quota, and historical sending stats
        #     - [String] username the username of the user (used for SMTP authentication)
        #     - [String] created_at the date and time that the user's Mandrill account was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] public_id a unique, permanent identifier for this user
        #     - [Integer] reputation the reputation of the user on a scale from 0 to 100, with 75 generally being a "good" reputation
        #     - [Integer] hourly_quota the maximum number of emails Mandrill will deliver for this user each hour.  Any emails beyond that will be accepted and queued for later delivery.  Users with higher reputations will have higher hourly quotas
        #     - [Integer] backlog the number of emails that are queued for delivery due to exceeding your monthly or hourly quotas
        #     - [Hash] stats an aggregate summary of the account's sending stats
        #         - [Hash] today stats for this user so far today
        #             - [Integer] sent the number of emails sent for this user so far today
        #             - [Integer] hard_bounces the number of emails hard bounced for this user so far today
        #             - [Integer] soft_bounces the number of emails soft bounced for this user so far today
        #             - [Integer] rejects the number of emails rejected for sending this user so far today
        #             - [Integer] complaints the number of spam complaints for this user so far today
        #             - [Integer] unsubs the number of unsubscribes for this user so far today
        #             - [Integer] opens the number of times emails have been opened for this user so far today
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user so far today
        #             - [Integer] clicks the number of URLs that have been clicked for this user so far today
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user so far today
        #         - [Hash] last_7_days stats for this user in the last 7 days
        #             - [Integer] sent the number of emails sent for this user in the last 7 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 7 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 7 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 7 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 7 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 7 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 7 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 7 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 7 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 7 days
        #         - [Hash] last_30_days stats for this user in the last 30 days
        #             - [Integer] sent the number of emails sent for this user in the last 30 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 30 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 30 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 30 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 30 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 30 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 30 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 30 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 30 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 30 days
        #         - [Hash] last_60_days stats for this user in the last 60 days
        #             - [Integer] sent the number of emails sent for this user in the last 60 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 60 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 60 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 60 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 60 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 60 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 60 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 60 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 60 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 60 days
        #         - [Hash] last_90_days stats for this user in the last 90 days
        #             - [Integer] sent the number of emails sent for this user in the last 90 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 90 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 90 days
        #             - [Integer] rejects the number of emails rejected for sending this user in the last 90 days
        #             - [Integer] complaints the number of spam complaints for this user in the last 90 days
        #             - [Integer] unsubs the number of unsubscribes for this user in the last 90 days
        #             - [Integer] opens the number of times emails have been opened for this user in the last 90 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 90 days
        #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 90 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 90 days
        #         - [Hash] all_time stats for the lifetime of the user's account
        #             - [Integer] sent the number of emails sent in the lifetime of the user's account
        #             - [Integer] hard_bounces the number of emails hard bounced in the lifetime of the user's account
        #             - [Integer] soft_bounces the number of emails soft bounced in the lifetime of the user's account
        #             - [Integer] rejects the number of emails rejected for sending this user so far today
        #             - [Integer] complaints the number of spam complaints in the lifetime of the user's account
        #             - [Integer] unsubs the number of unsubscribes in the lifetime of the user's account
        #             - [Integer] opens the number of times emails have been opened in the lifetime of the user's account
        #             - [Integer] unique_opens the number of unique opens for emails sent in the lifetime of the user's account
        #             - [Integer] clicks the number of URLs that have been clicked in the lifetime of the user's account
        #             - [Integer] unique_clicks the number of unique clicks for emails sent in the lifetime of the user's account
        def info()
            _params = {}
            return @master.call 'users/info', _params
        end

        # Validate an API key and respond to a ping (anal JSON parser version)
        # @return [Hash] a struct with one key "PING" with a static value "PONG!"
        def ping()
            _params = {}
            return @master.call 'users/ping2', _params
        end

        # Return the senders that have tried to use this account, both verified and unverified
        # @return [Array] an array of sender data, one for each sending addresses used by the account
        #     - [Hash] return[] the information on each sending address in the account
        #         - [String] address the sender's email address
        #         - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the total number of messages sent by this sender
        #         - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #         - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #         - [Integer] rejects the total number of rejected messages by this sender
        #         - [Integer] complaints the total number of spam complaints received for messages by this sender
        #         - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #         - [Integer] opens the total number of times messages by this sender have been opened
        #         - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #         - [Integer] unique_opens the number of unique opens for emails sent for this sender
        #         - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
        def senders()
            _params = {}
            return @master.call 'users/senders', _params
        end

    end
    class Rejects
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Adds an email to your email rejection blacklist. Addresses that you add manually will never expire and there is no reputation penalty for removing them from your blacklist. Attempting to blacklist an address that has been whitelisted will have no effect.
        # @param [String] email an email address to block
        # @return [Hash] a status object containing the address and the result of the operation
        #     - [String] email the email address you provided
        #     - [Boolean] added whether the operation succeeded
        def add(email)
            _params = {:email => email}
            return @master.call 'rejects/add', _params
        end

        # Retrieves your email rejection blacklist. You can provide an email address to limit the results. Returns up to 1000 results. By default, entries that have expired are excluded from the results; set include_expired to true to include them.
        # @param [String] email an optional email address to search by
        # @param [Boolean] include_expired whether to include rejections that have already expired.
        # @return [Array] Up to 1000 rejection entries
        #     - [Hash] return[] the information for each rejection blacklist entry
        #         - [String] email the email that is blocked
        #         - [String] reason the type of event (hard-bounce, soft-bounce, spam, unsub) that caused this rejection
        #         - [String] detail extended details about the event, such as the SMTP diagnostic for bounces or the comment for manually-created rejections
        #         - [String] created_at when the email was added to the blacklist
        #         - [String] last_event_at the timestamp of the most recent event that either created or renewed this rejection
        #         - [String] expires_at when the blacklist entry will expire (this may be in the past)
        #         - [Boolean] expired whether the blacklist entry has expired
        #         - [Hash] sender the sender that this blacklist entry applies to, or null if none.
        #             - [String] address the sender's email address
        #             - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #             - [Integer] sent the total number of messages sent by this sender
        #             - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #             - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #             - [Integer] rejects the total number of rejected messages by this sender
        #             - [Integer] complaints the total number of spam complaints received for messages by this sender
        #             - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #             - [Integer] opens the total number of times messages by this sender have been opened
        #             - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
        def list(email=nil, include_expired=false)
            _params = {:email => email, :include_expired => include_expired}
            return @master.call 'rejects/list', _params
        end

        # Deletes an email rejection. There is no limit to how many rejections you can remove from your blacklist, but keep in mind that each deletion has an affect on your reputation.
        # @param [String] email an email address
        # @return [Hash] a status object containing the address and whether the deletion succeeded.
        #     - [String] email the email address that was removed from the blacklist
        #     - [Boolean] deleted whether the address was deleted successfully.
        def delete(email)
            _params = {:email => email}
            return @master.call 'rejects/delete', _params
        end

    end
    class Inbound
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # List the domains that have been configured for inbound delivery
        # @return [Array] the inbound domains associated with the account
        #     - [Hash] return[] the individual domain info
        #         - [String] domain the domain name that is accepting mail
        #         - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
        def domains()
            _params = {}
            return @master.call 'inbound/domains', _params
        end

        # List the mailbox routes defined for an inbound domain
        # @param [String] domain the domain to check
        # @return [Array] the routes associated with the domain
        #     - [Hash] return[] the individual mailbox route
        #         - [String] pattern the search pattern that the mailbox name should match
        #         - [String] url the webhook URL where inbound messages will be published
        def routes(domain)
            _params = {:domain => domain}
            return @master.call 'inbound/routes', _params
        end

        # Take a raw MIME document destined for a domain with inbound domains set up, and send it to the inbound hook exactly as if it had been sent over SMTP
        # @param [String] raw_message the full MIME document of an email message
        # @param [Array, nil] to optionally define the recipients to receive the message - otherwise we'll use the To, Cc, and Bcc headers provided in the document
        #     - [String] to[] the email address of the recipient
        # @param [String] mail_from the address specified in the MAIL FROM stage of the SMTP conversation. Required for the SPF check.
        # @param [String] helo the identification provided by the client mta in the MTA state of the SMTP conversation. Required for the SPF check.
        # @param [String] client_address the remote MTA's ip address. Optional; required for the SPF check.
        # @return [Array] an array of the information for each recipient in the message (usually one) that matched an inbound route
        #     - [Hash] return[] the individual recipient information
        #         - [String] email the email address of the matching recipient
        #         - [String] pattern the mailbox route pattern that the recipient matched
        #         - [String] url the webhook URL that the message was posted to
        def send_raw(raw_message, to=nil, mail_from=nil, helo=nil, client_address=nil)
            _params = {:raw_message => raw_message, :to => to, :mail_from => mail_from, :helo => helo, :client_address => client_address}
            return @master.call 'inbound/send-raw', _params
        end

    end
    class Tags
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Return all of the user-defined tag information
        # @return [Array] a list of user-defined tags
        #     - [Hash] return[] a user-defined tag
        #         - [String] tag the actual tag as a string
        #         - [Integer] sent the total number of messages sent with this tag
        #         - [Integer] hard_bounces the total number of hard bounces by messages with this tag
        #         - [Integer] soft_bounces the total number of soft bounces by messages with this tag
        #         - [Integer] rejects the total number of rejected messages with this tag
        #         - [Integer] complaints the total number of spam complaints received for messages with this tag
        #         - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
        #         - [Integer] opens the total number of times messages with this tag have been opened
        #         - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
        #         - [Integer] unique_opens the number of unique opens for emails sent with this tag
        #         - [Integer] unique_clicks the number of unique clicks for emails sent with this tag
        def list()
            _params = {}
            return @master.call 'tags/list', _params
        end

        # Deletes a tag permanently. Deleting a tag removes the tag from any messages that have been sent, and also deletes the tag's stats. There is no way to undo this operation, so use it carefully.
        # @param [String] tag a tag name
        # @return [Hash] the tag that was deleted
        #     - [String] tag the actual tag as a string
        #     - [Integer] sent the total number of messages sent with this tag
        #     - [Integer] hard_bounces the total number of hard bounces by messages with this tag
        #     - [Integer] soft_bounces the total number of soft bounces by messages with this tag
        #     - [Integer] rejects the total number of rejected messages with this tag
        #     - [Integer] complaints the total number of spam complaints received for messages with this tag
        #     - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
        #     - [Integer] opens the total number of times messages with this tag have been opened
        #     - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
        #     - [Integer] unique_opens the number of unique opens for emails sent with this tag
        #     - [Integer] unique_clicks the number of unique clicks for emails sent with this tag
        def delete(tag)
            _params = {:tag => tag}
            return @master.call 'tags/delete', _params
        end

        # Return more detailed information about a single tag, including aggregates of recent stats
        # @param [String] tag an existing tag name
        # @return [Hash] the detailed information on the tag
        #     - [String] tag the actual tag as a string
        #     - [Integer] sent the total number of messages sent with this tag
        #     - [Integer] hard_bounces the total number of hard bounces by messages with this tag
        #     - [Integer] soft_bounces the total number of soft bounces by messages with this tag
        #     - [Integer] rejects the total number of rejected messages with this tag
        #     - [Integer] complaints the total number of spam complaints received for messages with this tag
        #     - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
        #     - [Integer] opens the total number of times messages with this tag have been opened
        #     - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
        #     - [Hash] stats an aggregate summary of the tag's sending stats
        #         - [Hash] today stats with this tag so far today
        #             - [Integer] sent the number of emails sent with this tag so far today
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag so far today
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag so far today
        #             - [Integer] rejects the number of emails rejected for sending this tag so far today
        #             - [Integer] complaints the number of spam complaints with this tag so far today
        #             - [Integer] unsubs the number of unsubscribes with this tag so far today
        #             - [Integer] opens the number of times emails have been opened with this tag so far today
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag so far today
        #             - [Integer] clicks the number of URLs that have been clicked with this tag so far today
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag so far today
        #         - [Hash] last_7_days stats with this tag in the last 7 days
        #             - [Integer] sent the number of emails sent with this tag in the last 7 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 7 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 7 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 7 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 7 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 7 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 7 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 7 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 7 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 7 days
        #         - [Hash] last_30_days stats with this tag in the last 30 days
        #             - [Integer] sent the number of emails sent with this tag in the last 30 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 30 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 30 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 30 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 30 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 30 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 30 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 30 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 30 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 30 days
        #         - [Hash] last_60_days stats with this tag in the last 60 days
        #             - [Integer] sent the number of emails sent with this tag in the last 60 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 60 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 60 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 60 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 60 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 60 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 60 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 60 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 60 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 60 days
        #         - [Hash] last_90_days stats with this tag in the last 90 days
        #             - [Integer] sent the number of emails sent with this tag in the last 90 days
        #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 90 days
        #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 90 days
        #             - [Integer] rejects the number of emails rejected for sending this tag in the last 90 days
        #             - [Integer] complaints the number of spam complaints with this tag in the last 90 days
        #             - [Integer] unsubs the number of unsubscribes with this tag in the last 90 days
        #             - [Integer] opens the number of times emails have been opened with this tag in the last 90 days
        #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 90 days
        #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 90 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 90 days
        def info(tag)
            _params = {:tag => tag}
            return @master.call 'tags/info', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a tag
        # @param [String] tag an existing tag name
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] unsubs the number of unsubscribes received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def time_series(tag)
            _params = {:tag => tag}
            return @master.call 'tags/time-series', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for all tags
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] unsubs the number of unsubscribes received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def all_time_series()
            _params = {}
            return @master.call 'tags/all-time-series', _params
        end

    end
    class Messages
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Send a new transactional message through Mandrill
        # @param [Hash] message the information on the message to send
        #     - [String] html the full HTML content to be sent
        #     - [String] text optional full text content to be sent
        #     - [String] subject the message subject
        #     - [String] from_email the sender email address.
        #     - [String] from_name optional from name to be used
        #     - [Array] to an array of recipient information.
        #         - [Hash] to[] a single recipient's information.
        #             - [String] email the email address of the recipient
        #             - [String] name the optional display name to use for the recipient
        #     - [Hash] headers optional extra headers to add to the message (currently only Reply-To and X-* headers are allowed)
        #     - [Boolean] important whether or not this message is important, and should be delivered ahead of non-important messages
        #     - [Boolean] track_opens whether or not to turn on open tracking for the message
        #     - [Boolean] track_clicks whether or not to turn on click tracking for the message
        #     - [Boolean] auto_text whether or not to automatically generate a text part for messages that are not given text
        #     - [Boolean] auto_html whether or not to automatically generate an HTML part for messages that are not given HTML
        #     - [Boolean] inline_css whether or not to automatically inline all CSS styles provided in the message HTML - only for HTML documents less than 256KB in size
        #     - [Boolean] url_strip_qs whether or not to strip the query string from URLs when aggregating tracked URL data
        #     - [Boolean] preserve_recipients whether or not to expose all recipients in to "To" header for each email
        #     - [String] bcc_address an optional address to receive an exact copy of each recipient's email
        #     - [String] tracking_domain a custom domain to use for tracking opens and clicks instead of mandrillapp.com
        #     - [String] signing_domain a custom domain to use for SPF/DKIM signing instead of mandrill (for "via" or "on behalf of" in email clients)
        #     - [Boolean] merge whether to evaluate merge tags in the message. Will automatically be set to true if either merge_vars or global_merge_vars are provided.
        #     - [Array] global_merge_vars global merge variables to use for all recipients. You can override these per recipient.
        #         - [Hash] global_merge_vars[] a single global merge variable
        #             - [String] name the global merge variable's name. Merge variable names are case-insensitive and may not start with _
        #             - [String] content the global merge variable's content
        #     - [Array] merge_vars per-recipient merge variables, which override global merge variables with the same name.
        #         - [Hash] merge_vars[] per-recipient merge variables
        #             - [String] rcpt the email address of the recipient that the merge variables should apply to
        #             - [Array] vars the recipient's merge variables
        #                 - [Hash] vars[] a single merge variable
        #                     - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
        #                     - [String] content the merge variable's content
        #     - [Array] tags an array of string to tag the message with.  Stats are accumulated using tags, though we only store the first 100 we see, so this should not be unique or change frequently.  Tags should be 50 characters or less.  Any tags starting with an underscore are reserved for internal use and will cause errors.
        #         - [String] tags[] a single tag - must not start with an underscore
        #     - [Array] google_analytics_domains an array of strings indicating for which any matching URLs will automatically have Google Analytics parameters appended to their query string automatically.
        #     - [Array, String] google_analytics_campaign optional string indicating the value to set for the utm_campaign tracking parameter. If this isn't provided the email's from address will be used instead.
        #     - [Array] metadata metadata an associative array of user metadata. Mandrill will store this metadata and make it available for retrieval. In addition, you can select up to 10 metadata fields to index and make searchable using the Mandrill search api.
        #     - [Array] recipient_metadata Per-recipient metadata that will override the global values specified in the metadata parameter.
        #         - [Hash] recipient_metadata[] metadata for a single recipient
        #             - [String] rcpt the email address of the recipient that the metadata is associated with
        #             - [Array] values an associated array containing the recipient's unique metadata. If a key exists in both the per-recipient metadata and the global metadata, the per-recipient metadata will be used.
        #     - [Array] attachments an array of supported attachments to add to the message
        #         - [Hash] attachments[] a single supported attachment
        #             - [String] type the MIME type of the attachment
        #             - [String] name the file name of the attachment
        #             - [String] content the content of the attachment as a base64-encoded string
        #     - [Array] images an array of embedded images to add to the message
        #         - [Hash] images[] a single embedded image
        #             - [String] type the MIME type of the image - must start with "image/"
        #             - [String] name the Content ID of the image - use <img src="cid:THIS_VALUE"> to reference the image in your HTML content
        #             - [String] content the content of the image as a base64-encoded string
        # @param [Boolean] async enable a background sending mode that is optimized for bulk sending. In async mode, messages/send will immediately return a status of "queued" for every recipient. To handle rejections when sending in async mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients; messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
        # @param [String] ip_pool the name of the dedicated ip pool that should be used to send the message. If you do not have any dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will be used instead.
        # @param [String] send_at when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately. An additional fee applies for scheduled email, and this feature is only available to accounts with a positive balance.
        # @return [Array] of structs for each recipient containing the key "email" with the email address and "status" as either "sent", "queued", or "rejected"
        #     - [Hash] return[] the sending results for a single recipient
        #         - [String] email the email address of the recipient
        #         - [String] status the sending status of the recipient - either "sent", "queued", "scheduled", "rejected", or "invalid"
        #         - [String] reject_reason the reason for the rejection if the recipient status is "rejected"
        #         - [String] _id the message's unique id
        def send(message, async=false, ip_pool=nil, send_at=nil)
            _params = {:message => message, :async => async, :ip_pool => ip_pool, :send_at => send_at}
            return @master.call 'messages/send', _params
        end

        # Send a new transactional message through Mandrill using a template
        # @param [String] template_name the immutable name or slug of a template that exists in the user's account. For backwards-compatibility, the template name may also be used but the immutable slug is preferred.
        # @param [Array] template_content an array of template content to send.  Each item in the array should be a struct with two keys - name: the name of the content block to set the content for, and content: the actual content to put into the block
        #     - [Hash] template_content[] the injection of a single piece of content into a single editable region
        #         - [String] name the name of the mc:edit editable region to inject into
        #         - [String] content the content to inject
        # @param [Hash] message the other information on the message to send - same as /messages/send, but without the html content
        #     - [String] html optional full HTML content to be sent if not in template
        #     - [String] text optional full text content to be sent
        #     - [String] subject the message subject
        #     - [String] from_email the sender email address.
        #     - [String] from_name optional from name to be used
        #     - [Array] to an array of recipient information.
        #         - [Hash] to[] a single recipient's information.
        #             - [String] email the email address of the recipient
        #             - [String] name the optional display name to use for the recipient
        #     - [Hash] headers optional extra headers to add to the message (currently only Reply-To and X-* headers are allowed)
        #     - [Boolean] important whether or not this message is important, and should be delivered ahead of non-important messages
        #     - [Boolean] track_opens whether or not to turn on open tracking for the message
        #     - [Boolean] track_clicks whether or not to turn on click tracking for the message
        #     - [Boolean] auto_text whether or not to automatically generate a text part for messages that are not given text
        #     - [Boolean] auto_html whether or not to automatically generate an HTML part for messages that are not given HTML
        #     - [Boolean] inline_css whether or not to automatically inline all CSS styles provided in the message HTML - only for HTML documents less than 256KB in size
        #     - [Boolean] url_strip_qs whether or not to strip the query string from URLs when aggregating tracked URL data
        #     - [Boolean] preserve_recipients whether or not to expose all recipients in to "To" header for each email
        #     - [String] bcc_address an optional address to receive an exact copy of each recipient's email
        #     - [String] tracking_domain a custom domain to use for tracking opens and clicks instead of mandrillapp.com
        #     - [String] signing_domain a custom domain to use for SPF/DKIM signing instead of mandrill (for "via" or "on behalf of" in email clients)
        #     - [Boolean] merge whether to evaluate merge tags in the message. Will automatically be set to true if either merge_vars or global_merge_vars are provided.
        #     - [Array] global_merge_vars global merge variables to use for all recipients. You can override these per recipient.
        #         - [Hash] global_merge_vars[] a single global merge variable
        #             - [String] name the global merge variable's name. Merge variable names are case-insensitive and may not start with _
        #             - [String] content the global merge variable's content
        #     - [Array] merge_vars per-recipient merge variables, which override global merge variables with the same name.
        #         - [Hash] merge_vars[] per-recipient merge variables
        #             - [String] rcpt the email address of the recipient that the merge variables should apply to
        #             - [Array] vars the recipient's merge variables
        #                 - [Hash] vars[] a single merge variable
        #                     - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
        #                     - [String] content the merge variable's content
        #     - [Array] tags an array of string to tag the message with.  Stats are accumulated using tags, though we only store the first 100 we see, so this should not be unique or change frequently.  Tags should be 50 characters or less.  Any tags starting with an underscore are reserved for internal use and will cause errors.
        #         - [String] tags[] a single tag - must not start with an underscore
        #     - [Array] google_analytics_domains an array of strings indicating for which any matching URLs will automatically have Google Analytics parameters appended to their query string automatically.
        #     - [Array, String] google_analytics_campaign optional string indicating the value to set for the utm_campaign tracking parameter. If this isn't provided the email's from address will be used instead.
        #     - [Array] metadata metadata an associative array of user metadata. Mandrill will store this metadata and make it available for retrieval. In addition, you can select up to 10 metadata fields to index and make searchable using the Mandrill search api.
        #     - [Array] recipient_metadata Per-recipient metadata that will override the global values specified in the metadata parameter.
        #         - [Hash] recipient_metadata[] metadata for a single recipient
        #             - [String] rcpt the email address of the recipient that the metadata is associated with
        #             - [Array] values an associated array containing the recipient's unique metadata. If a key exists in both the per-recipient metadata and the global metadata, the per-recipient metadata will be used.
        #     - [Array] attachments an array of supported attachments to add to the message
        #         - [Hash] attachments[] a single supported attachment
        #             - [String] type the MIME type of the attachment
        #             - [String] name the file name of the attachment
        #             - [String] content the content of the attachment as a base64-encoded string
        #     - [Array] images an array of embedded images to add to the message
        #         - [Hash] images[] a single embedded image
        #             - [String] type the MIME type of the image - must start with "image/"
        #             - [String] name the Content ID of the image - use <img src="cid:THIS_VALUE"> to reference the image in your HTML content
        #             - [String] content the content of the image as a base64-encoded string
        # @param [Boolean] async enable a background sending mode that is optimized for bulk sending. In async mode, messages/send will immediately return a status of "queued" for every recipient. To handle rejections when sending in async mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients; messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
        # @param [String] ip_pool the name of the dedicated ip pool that should be used to send the message. If you do not have any dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will be used instead.
        # @param [String] send_at when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately. An additional fee applies for scheduled email, and this feature is only available to accounts with a positive balance.
        # @return [Array] of structs for each recipient containing the key "email" with the email address and "status" as either "sent", "queued", "scheduled", or "rejected"
        #     - [Hash] return[] the sending results for a single recipient
        #         - [String] email the email address of the recipient
        #         - [String] status the sending status of the recipient - either "sent", "queued", "rejected", or "invalid"
        #         - [String] reject_reason the reason for the rejection if the recipient status is "rejected"
        #         - [String] _id the message's unique id
        def send_template(template_name, template_content, message, async=false, ip_pool=nil, send_at=nil)
            _params = {:template_name => template_name, :template_content => template_content, :message => message, :async => async, :ip_pool => ip_pool, :send_at => send_at}
            return @master.call 'messages/send-template', _params
        end

        # Search the content of recently sent messages and optionally narrow by date range, tags and senders
        # @param [String] query the search terms to find matching messages for
        # @param [String] date_from start date
        # @param [String] date_to end date
        # @param [Array] tags an array of tag names to narrow the search to, will return messages that contain ANY of the tags
        # @param [Array] senders an array of sender addresses to narrow the search to, will return messages sent by ANY of the senders
        # @param [Integer] limit the maximum number of results to return, defaults to 100, 1000 is the maximum
        # @return [Array] of structs for each matching message
        #     - [Hash] return[] the information for a single matching message
        #         - [Integer] ts the Unix timestamp from when this message was sent
        #         - [String] _id the message's unique id
        #         - [String] sender the email address of the sender
        #         - [String] template the unique name of the template used, if any
        #         - [String] subject the message's subject link
        #         - [String] email the recipient email address
        #         - [Array] tags list of tags on this message
        #             - [String] tags[] individual tag on this message
        #         - [Integer] opens how many times has this message been opened
        #         - [Array] opens_detail list of individual opens for the message
        #             - [Hash] opens_detail[] information on an individual open
        #                 - [Integer] ts the unix timestamp from when the message was opened
        #                 - [String] ip the IP address that generated the open
        #                 - [String] location the approximate region and country that the opening IP is located
        #                 - [String] ua the email client or browser data of the open
        #         - [Integer] clicks how many times has a link been clicked in this message
        #         - [Array] clicks_detail list of individual clicks for the message
        #             - [Hash] clicks_detail[] information on an individual click
        #                 - [Integer] ts the unix timestamp from when the message was clicked
        #                 - [String] url the URL that was clicked on
        #                 - [String] ip the IP address that generated the click
        #                 - [String] location the approximate region and country that the clicking IP is located
        #                 - [String] ua the email client or browser data of the click
        #         - [String] state sending status of this message: sent, bounced, rejected
        #         - [Hash] metadata any custom metadata provided when the message was sent
        def search(query='*', date_from=nil, date_to=nil, tags=nil, senders=nil, limit=100)
            _params = {:query => query, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders, :limit => limit}
            return @master.call 'messages/search', _params
        end

        # Get the information for a single recently sent message
        # @param [String] id the unique id of the message to get - passed as the "_id" field in webhooks, send calls, or search calls
        # @return [Hash] the information for the message
        #     - [Integer] ts the Unix timestamp from when this message was sent
        #     - [String] _id the message's unique id
        #     - [String] sender the email address of the sender
        #     - [String] template the unique name of the template used, if any
        #     - [String] subject the message's subject link
        #     - [String] email the recipient email address
        #     - [Array] tags list of tags on this message
        #         - [String] tags[] individual tag on this message
        #     - [Integer] opens how many times has this message been opened
        #     - [Array] opens_detail list of individual opens for the message
        #         - [Hash] opens_detail[] information on an individual open
        #             - [Integer] ts the unix timestamp from when the message was opened
        #             - [String] ip the IP address that generated the open
        #             - [String] location the approximate region and country that the opening IP is located
        #             - [String] ua the email client or browser data of the open
        #     - [Integer] clicks how many times has a link been clicked in this message
        #     - [Array] clicks_detail list of individual clicks for the message
        #         - [Hash] clicks_detail[] information on an individual click
        #             - [Integer] ts the unix timestamp from when the message was clicked
        #             - [String] url the URL that was clicked on
        #             - [String] ip the IP address that generated the click
        #             - [String] location the approximate region and country that the clicking IP is located
        #             - [String] ua the email client or browser data of the click
        #     - [String] state sending status of this message: sent, bounced, rejected
        #     - [Hash] metadata any custom metadata provided when the message was sent
        def info(id)
            _params = {:id => id}
            return @master.call 'messages/info', _params
        end

        # Parse the full MIME document for an email message, returning the content of the message broken into its constituent pieces
        # @param [String] raw_message the full MIME document of an email message
        # @return [Hash] the parsed message
        #     - [String] subject the subject of the message
        #     - [String] from_email the email address of the sender
        #     - [String] from_name the alias of the sender (if any)
        #     - [Array] to an array of any recipients in the message
        #         - [Hash] to[] the information on a single recipient
        #             - [String] email the email address of the recipient
        #             - [String] name the alias of the recipient (if any)
        #     - [Hash] headers the key-value pairs of the MIME headers for the message's main document
        #     - [String] text the text part of the message, if any
        #     - [String] html the HTML part of the message, if any
        #     - [Array] attachments an array of any attachments that can be found in the message
        #         - [Hash] attachments[] information about an individual attachment
        #             - [String] name the file name of the attachment
        #             - [String] type the MIME type of the attachment
        #             - [Boolean] binary if this is set to true, the attachment is not pure-text, and the content will be base64 encoded
        #             - [String] content the content of the attachment as a text string or a base64 encoded string based on the attachment type
        #     - [Array] images an array of any embedded images that can be found in the message
        #         - [Hash] images[] information about an individual image
        #             - [String] name the Content-ID of the embedded image
        #             - [String] type the MIME type of the image
        #             - [String] content the content of the image as a base64 encoded string
        def parse(raw_message)
            _params = {:raw_message => raw_message}
            return @master.call 'messages/parse', _params
        end

        # Take a raw MIME document for a message, and send it exactly as if it were sent over the SMTP protocol
        # @param [String] raw_message the full MIME document of an email message
        # @param [String, nil] from_email optionally define the sender address - otherwise we'll use the address found in the provided headers
        # @param [String, nil] from_name optionally define the sender alias
        # @param [Array, nil] to optionally define the recipients to receive the message - otherwise we'll use the To, Cc, and Bcc headers provided in the document
        #     - [String] to[] the email address of the recipint
        # @param [Boolean] async enable a background sending mode that is optimized for bulk sending. In async mode, messages/sendRaw will immediately return a status of "queued" for every recipient. To handle rejections when sending in async mode, set up a webhook for the 'reject' event. Defaults to false for messages with no more than 10 recipients; messages with more than 10 recipients are always sent asynchronously, regardless of the value of async.
        # @param [String] ip_pool the name of the dedicated ip pool that should be used to send the message. If you do not have any dedicated IPs, this parameter has no effect. If you specify a pool that does not exist, your default pool will be used instead.
        # @param [String] send_at when this message should be sent as a UTC timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately.
        # @return [Array] of structs for each recipient containing the key "email" with the email address and "status" as either "sent", "queued", or "rejected"
        #     - [Hash] return[] the sending results for a single recipient
        #         - [String] email the email address of the recipient
        #         - [String] status the sending status of the recipient - either "sent", "queued", "scheduled", "rejected", or "invalid"
        #         - [String] reject_reason the reason for the rejection if the recipient status is "rejected"
        #         - [String] _id the message's unique id
        def send_raw(raw_message, from_email=nil, from_name=nil, to=nil, async=false, ip_pool=nil, send_at=nil)
            _params = {:raw_message => raw_message, :from_email => from_email, :from_name => from_name, :to => to, :async => async, :ip_pool => ip_pool, :send_at => send_at}
            return @master.call 'messages/send-raw', _params
        end

        # Queries your scheduled emails by sender or recipient, or both.
        # @param [String] to an optional recipient address to restrict results to
        # @return [Array] a list of up to 1000 scheduled emails
        #     - [Hash] return[] a scheduled email
        #         - [String] _id the scheduled message id
        #         - [String] created_at the UTC timestamp when the message was created, in YYYY-MM-DD HH:MM:SS format
        #         - [String] send_at the UTC timestamp when the message will be sent, in YYYY-MM-DD HH:MM:SS format
        #         - [String] from_email the email's sender address
        #         - [String] to the email's recipient
        #         - [String] subject the email's subject
        def list_scheduled(to=nil)
            _params = {:to => to}
            return @master.call 'messages/list-scheduled', _params
        end

        # Cancels a scheduled email.
        # @param [String] id a scheduled email id, as returned by any of the messages/send calls or messages/list-scheduled
        # @return [Hash] information about the scheduled email that was cancelled.
        #     - [String] _id the scheduled message id
        #     - [String] created_at the UTC timestamp when the message was created, in YYYY-MM-DD HH:MM:SS format
        #     - [String] send_at the UTC timestamp when the message will be sent, in YYYY-MM-DD HH:MM:SS format
        #     - [String] from_email the email's sender address
        #     - [String] to the email's recipient
        #     - [String] subject the email's subject
        def cancel_scheduled(id)
            _params = {:id => id}
            return @master.call 'messages/cancel-scheduled', _params
        end

        # Reschedules a scheduled email.
        # @param [String] id a scheduled email id, as returned by any of the messages/send calls or messages/list-scheduled
        # @param [String] send_at the new UTC timestamp when the message should sent. Mandrill can't time travel, so if you specify a time in past the message will be sent immediately
        # @return [Hash] information about the scheduled email that was rescheduled.
        #     - [String] _id the scheduled message id
        #     - [String] created_at the UTC timestamp when the message was created, in YYYY-MM-DD HH:MM:SS format
        #     - [String] send_at the UTC timestamp when the message will be sent, in YYYY-MM-DD HH:MM:SS format
        #     - [String] from_email the email's sender address
        #     - [String] to the email's recipient
        #     - [String] subject the email's subject
        def reschedule(id, send_at)
            _params = {:id => id, :send_at => send_at}
            return @master.call 'messages/reschedule', _params
        end

    end
    class Whitelists
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Adds an email to your email rejection whitelist. If the address is currently on your blacklist, that blacklist entry will be removed automatically.
        # @param [String] email an email address to add to the whitelist
        # @return [Hash] a status object containing the address and the result of the operation
        #     - [String] email the email address you provided
        #     - [Boolean] whether the operation succeeded
        def add(email)
            _params = {:email => email}
            return @master.call 'whitelists/add', _params
        end

        # Retrieves your email rejection whitelist. You can provide an email address or search prefix to limit the results. Returns up to 1000 results.
        # @param [String] email an optional email address or prefix to search by
        # @return [Array] up to 1000 whitelist entries
        #     - [Hash] return[] the information for each whitelist entry
        #         - [String] email the email that is whitelisted
        #         - [String] detail a description of why the email was whitelisted
        #         - [String] created_at when the email was added to the whitelist
        def list(email=nil)
            _params = {:email => email}
            return @master.call 'whitelists/list', _params
        end

        # Removes an email address from the whitelist.
        # @param [String] email the email address to remove from the whitelist
        # @return [Hash] a status object containing the address and whether the deletion succeeded
        #     - [String] email the email address that was removed from the blacklist
        #     - [Boolean] deleted whether the address was deleted successfully
        def delete(email)
            _params = {:email => email}
            return @master.call 'whitelists/delete', _params
        end

    end
    class Internal
        attr_accessor :master

        def initialize(master)
            @master = master
        end

    end
    class Urls
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Get the 100 most clicked URLs
        # @return [Array] the 100 most clicked URLs and their stats
        #     - [Hash] return[] the individual URL stats
        #         - [String] url the URL to be tracked
        #         - [Integer] sent the number of emails that contained the URL
        #         - [Integer] clicks the number of times the URL has been clicked from a tracked email
        #         - [Integer] unique_clicks the number of unique emails that have generated clicks for this URL
        def list()
            _params = {}
            return @master.call 'urls/list', _params
        end

        # Return the 100 most clicked URLs that match the search query given
        # @param [String] q a search query
        # @return [Array] the 100 most clicked URLs matching the search query
        #     - [Hash] return[] the URL matching the query
        #         - [String] url the URL to be tracked
        #         - [Integer] sent the number of emails that contained the URL
        #         - [Integer] clicks the number of times the URL has been clicked from a tracked email
        #         - [Integer] unique_clicks the number of unique emails that have generated clicks for this URL
        def search(q)
            _params = {:q => q}
            return @master.call 'urls/search', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a url
        # @param [String] url an existing URL
        # @return [Array] the array of history information
        #     - [Hash] return[] the information for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent with the URL during the hour
        #         - [Integer] clicks the number of times the URL was clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated for emails sent with this URL during the hour
        def time_series(url)
            _params = {:url => url}
            return @master.call 'urls/time-series', _params
        end

    end
    class Webhooks
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Get the list of all webhooks defined on the account
        # @return [Array] the webhooks associated with the account
        #     - [Hash] return[] the individual webhook info
        #         - [Integer] id a unique integer indentifier for the webhook
        #         - [String] url The URL that the event data will be posted to
        #         - [String] description a description of the webhook
        #         - [String] auth_key the key used to requests for this webhook
        #         - [Array] events The message events that will be posted to the hook
        #             - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #         - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #         - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #         - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def list()
            _params = {}
            return @master.call 'webhooks/list', _params
        end

        # Add a new webhook
        # @param [String] url the URL to POST batches of events
        # @param [String] description an optional description of the webhook
        # @param [Array] events an optional list of events that will be posted to the webhook
        #     - [String] events[] the individual event to listen for
        # @return [Hash] the information saved about the new webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def add(url, description=nil, events=[])
            _params = {:url => url, :description => description, :events => events}
            return @master.call 'webhooks/add', _params
        end

        # Given the ID of an existing webhook, return the data about it
        # @param [Integer] id the unique identifier of a webhook belonging to this account
        # @return [Hash] the information about the webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def info(id)
            _params = {:id => id}
            return @master.call 'webhooks/info', _params
        end

        # Update an existing webhook
        # @param [Integer] id the unique identifier of a webhook belonging to this account
        # @param [String] url the URL to POST batches of events
        # @param [String] description an optional description of the webhook
        # @param [Array] events an optional list of events that will be posted to the webhook
        #     - [String] events[] the individual event to listen for
        # @return [Hash] the information for the updated webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def update(id, url, description=nil, events=[])
            _params = {:id => id, :url => url, :description => description, :events => events}
            return @master.call 'webhooks/update', _params
        end

        # Delete an existing webhook
        # @param [Integer] id the unique identifier of a webhook belonging to this account
        # @return [Hash] the information for the deleted webhook
        #     - [Integer] id a unique integer indentifier for the webhook
        #     - [String] url The URL that the event data will be posted to
        #     - [String] description a description of the webhook
        #     - [String] auth_key the key used to requests for this webhook
        #     - [Array] events The message events that will be posted to the hook
        #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
        #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
        #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
        #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
        def delete(id)
            _params = {:id => id}
            return @master.call 'webhooks/delete', _params
        end

    end
    class Senders
        attr_accessor :master

        def initialize(master)
            @master = master
        end

        # Return the senders that have tried to use this account.
        # @return [Array] an array of sender data, one for each sending addresses used by the account
        #     - [Hash] return[] the information on each sending address in the account
        #         - [String] address the sender's email address
        #         - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the total number of messages sent by this sender
        #         - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #         - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #         - [Integer] rejects the total number of rejected messages by this sender
        #         - [Integer] complaints the total number of spam complaints received for messages by this sender
        #         - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #         - [Integer] opens the total number of times messages by this sender have been opened
        #         - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #         - [Integer] unique_opens the number of unique opens for emails sent for this sender
        #         - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
        def list()
            _params = {}
            return @master.call 'senders/list', _params
        end

        # Returns the sender domains that have been added to this account.
        # @return [Array] an array of sender domain data, one for each sending domain used by the account
        #     - [Hash] return[] the information on each sending domain for the account
        #         - [String] domain the sender domain name
        #         - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
        def domains()
            _params = {}
            return @master.call 'senders/domains', _params
        end

        # Return more detailed information about a single sender, including aggregates of recent stats
        # @param [String] address the email address of the sender
        # @return [Hash] the detailed information on the sender
        #     - [String] address the sender's email address
        #     - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #     - [Integer] sent the total number of messages sent by this sender
        #     - [Integer] hard_bounces the total number of hard bounces by messages by this sender
        #     - [Integer] soft_bounces the total number of soft bounces by messages by this sender
        #     - [Integer] rejects the total number of rejected messages by this sender
        #     - [Integer] complaints the total number of spam complaints received for messages by this sender
        #     - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
        #     - [Integer] opens the total number of times messages by this sender have been opened
        #     - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
        #     - [Hash] stats an aggregate summary of the sender's sending stats
        #         - [Hash] today stats for this sender so far today
        #             - [Integer] sent the number of emails sent for this sender so far today
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender so far today
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender so far today
        #             - [Integer] rejects the number of emails rejected for sending this sender so far today
        #             - [Integer] complaints the number of spam complaints for this sender so far today
        #             - [Integer] unsubs the number of unsubscribes for this sender so far today
        #             - [Integer] opens the number of times emails have been opened for this sender so far today
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender so far today
        #             - [Integer] clicks the number of URLs that have been clicked for this sender so far today
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender so far today
        #         - [Hash] last_7_days stats for this sender in the last 7 days
        #             - [Integer] sent the number of emails sent for this sender in the last 7 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 7 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 7 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 7 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 7 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 7 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 7 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 7 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 7 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 7 days
        #         - [Hash] last_30_days stats for this sender in the last 30 days
        #             - [Integer] sent the number of emails sent for this sender in the last 30 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 30 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 30 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 30 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 30 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 30 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 30 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 30 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 30 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 30 days
        #         - [Hash] last_60_days stats for this sender in the last 60 days
        #             - [Integer] sent the number of emails sent for this sender in the last 60 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 60 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 60 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 60 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 60 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 60 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 60 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 60 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 60 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 60 days
        #         - [Hash] last_90_days stats for this sender in the last 90 days
        #             - [Integer] sent the number of emails sent for this sender in the last 90 days
        #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 90 days
        #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 90 days
        #             - [Integer] rejects the number of emails rejected for sending this sender in the last 90 days
        #             - [Integer] complaints the number of spam complaints for this sender in the last 90 days
        #             - [Integer] unsubs the number of unsubscribes for this sender in the last 90 days
        #             - [Integer] opens the number of times emails have been opened for this sender in the last 90 days
        #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 90 days
        #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 90 days
        #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 90 days
        def info(address)
            _params = {:address => address}
            return @master.call 'senders/info', _params
        end

        # Return the recent history (hourly stats for the last 30 days) for a sender
        # @param [String] address the email address of the sender
        # @return [Array] the array of history information
        #     - [Hash] return[] the stats for a single hour
        #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
        #         - [Integer] sent the number of emails that were sent during the hour
        #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
        #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
        #         - [Integer] rejects the number of emails that were rejected during the hour
        #         - [Integer] complaints the number of spam complaints received during the hour
        #         - [Integer] opens the number of emails opened during the hour
        #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
        #         - [Integer] clicks the number of tracked URLs clicked during the hour
        #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
        def time_series(address)
            _params = {:address => address}
            return @master.call 'senders/time-series', _params
        end

    end
end

