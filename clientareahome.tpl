{include file="$template/includes/flashmessage.tpl"}

<div class="tiles clearfix">
    <div class="row">
        <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=services'">
            <a href="clientarea.php?action=services">
                <div class="icon"><i class="fas fa-cube"></i></div>
                <div class="stat">{$clientsstats.productsnumactive}</div>
                <div class="title">{$LANG.navservices}</div>
                <div class="highlight bg-color-blue"></div>
            </a>
        </div>
        {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
            <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=domains'">
                <a href="clientarea.php?action=domains">
                    <div class="icon"><i class="fas fa-globe"></i></div>
                    <div class="stat">{$clientsstats.numactivedomains}</div>
                    <div class="title">{$LANG.navdomains}</div>
                    <div class="highlight bg-color-green"></div>
                </a>
            </div>
        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
            <div class="col-sm-3 col-xs-6 tile" onclick="window.location='affiliates.php'">
                <a href="affiliates.php">
                    <div class="icon"><i class="fas fa-shopping-cart"></i></div>
                    <div class="stat">{$clientsstats.numaffiliatesignups}</div>
                    <div class="title">{$LANG.affiliatessignups}</div>
                    <div class="highlight bg-color-green"></div>
                </a>
            </div>
        {else}
            <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=quotes'">
                <a href="clientarea.php?action=quotes">
                    <div class="icon"><i class="far fa-file-alt"></i></div>
                    <div class="stat">{$clientsstats.numquotes}</div>
                    <div class="title">{$LANG.quotes}</div>
                    <div class="highlight bg-color-green"></div>
                </a>
            </div>
        {/if}
        <div class="col-sm-3 col-xs-6 tile" onclick="window.location='supporttickets.php'">
            <a href="supporttickets.php">
                <div class="icon"><i class="fas fa-comments"></i></div>
                <div class="stat">{$clientsstats.numactivetickets}</div>
                <div class="title">{$LANG.navtickets}</div>
                <div class="highlight bg-color-red"></div>
            </a>
        </div>
        <div class="col-sm-3 col-xs-6 tile" onclick="window.location='clientarea.php?action=invoices'">
            <a href="clientarea.php?action=invoices">
                <div class="icon"><i class="fas fa-credit-card"></i></div>
                <div class="stat">{$clientsstats.numunpaidinvoices}</div>
                <div class="title">{$LANG.navinvoices}</div>
                <div class="highlight bg-color-gold"></div>
            </a>
        </div>
    </div>
</div>

<form role="form" method="post" action="clientarea.php?action=kbsearch">
    <div class="row">
        <div class="col-md-12 home-kb-search">
            <input type="text" name="search" class="form-control input-lg" placeholder="{$LANG.clientHomeSearchKb}" />
            <i class="fas fa-search"></i>
        </div>
    </div>
</form>

{foreach from=$addons_html item=addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

{function name=outputHomePanels}
    <div menuItemName="{$item->getName()}" class="panel panel-default panel-accent-{$item->getExtra('color')}">
        <div class="panel-heading">
            <h3 class="panel-title">
                {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                    <div class="pull-right">
                        <a href="{$item->getExtra('btn-link')}" class="btn btn-default bg-color-{$item->getExtra('color')} btn-xs">
                            {$item->getExtra('btn-text')}
                        </a>
                    </div>
                {/if}
                {$item->getLabel()}
            </h3>
        </div>
        {if $item->hasBodyHtml()}
            <div class="panel-body">
                {$item->getBodyHtml()}
            </div>
        {/if}
    </div>
{/function}

{foreach from=$panels item=item}
    {outputHomePanels}
{/foreach}
